import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ramadantime/res/colors/app_color.dart';
import 'package:ramadantime/res/routes/route_name.dart';
import 'package:ramadantime/res/widgets/customBottomBar.dart';
import 'package:ramadantime/utils/time_format.dart';
import 'package:ramadantime/view-models/controller/place_controller.dart';

class TimeView extends StatefulWidget {
  const TimeView({super.key});

  @override
  State<TimeView> createState() => _TimeViewState();
}

class _TimeViewState extends State<TimeView> {
  final PlaceController _controller = Get.put(PlaceController());

  @override
  void initState() {
    // TODO: implement initState
    _controller.fetchTime();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    String formattedTime = DateFormat('h:mm').format(now);
    // Parse Maghrib prayer time
    DateTime maghribTime = DateFormat('HH:mm').parse(_controller.prayerTimes['Maghrib']);

// Log the values for verification
    print('Maghrib Time: $maghribTime');
    print('Current Time: ${DateTime.now()}');

// Calculate time difference
    Duration timeDifference = maghribTime.difference(DateTime.now());
    print('Time Difference: $timeDifference');

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.appColor,
        iconTheme: const IconThemeData(color: AppColor.fontColor),
        title: Row(
          children: [
            Obx(() => Text(
                  '${_controller.savedPlace != null ? _controller.savedPlace : ''}',
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColor.fontColor),
                )),
            IconButton(
              onPressed: () {
                Get.toNamed(RouteName.placeSelection);
              },
              icon: const Icon(Icons.keyboard_arrow_down_outlined),
              color: AppColor.fontColor,
            )
          ],
        ),
      ),
      body:_controller.prayerTimes.isEmpty? const Center(
        child: CircularProgressIndicator(
          color:AppColor.appColor,
        ),
      ) :Obx(
        () => Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  color: AppColor.appColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '${DateFormat('dd MMMM yyyy', 'bn').format(DateFormat('dd MMM yyyy').parse(_controller.currentDate.value))}',
                        style: const TextStyle(
                          color: AppColor.fontColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'এখন সময় ${DateFormat('h:mm ', 'bn').format(now)}মি', // Format the time in Bangla
                        style: const TextStyle(
                          color: AppColor.fontColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      // const Text(
                      //   'রমজান ২০২৪ এর বাকি আছে ৩০দিন ',
                      //   style: TextStyle(
                      //       color: AppColor.fontColor,
                      //       fontSize:15,
                      //       fontWeight: FontWeight.w600),
                      // ),
                    ],
                  ),
                )),

            Container(
                decoration: BoxDecoration(
                  color: AppColor.appColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                   // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'আজকের সময়সূচী',
                        style: TextStyle(
                            color: AppColor.fontColor,
                            fontSize:20,
                            fontWeight: FontWeight.w600),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           Text(
                            'ইফতারের সময়- ${TimeFormat(timeString: _controller.prayerTimes['Maghrib']).timeConvert()} মি:',
                            style: const TextStyle(
                                color: AppColor.fontColor,
                                fontSize:15,
                                fontWeight: FontWeight.w600),
                                                 ),
                           // Container(
                           //   height: 25,
                           //   width: 70,
                           //   decoration: BoxDecoration(
                           //     color: Colors.white,
                           //     borderRadius: BorderRadius.circular(5),
                           //   ),
                           //   margin: const EdgeInsets.all(10),
                           //   padding: const EdgeInsets.symmetric(
                           //       vertical: 5),
                           //   child: CountdownTimer(
                           //     endTime: DateTime.now().millisecondsSinceEpoch + timeDifference.inMilliseconds,
                           //     textStyle: TextStyle(
                           //       color: Colors.black,
                           //     ),
                           //     onEnd: () {
                           //       // Optionally, you can perform some action when the countdown ends
                           //     },
                           //   ),
                           //
                           // ),
                         ],
                       ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'সেহরির সময়- ${TimeFormat(timeString: _controller.prayerTimes['Fajr']).timeConvert()} মি:',
                            style: const TextStyle(
                                color: AppColor.fontColor,
                                fontSize:15,
                                fontWeight: FontWeight.w600),
                          ),
                          // Container(
                          //   height: 25,
                          //   width: 70,
                          //   decoration: BoxDecoration(
                          //     color: Colors.white,
                          //     borderRadius: BorderRadius.circular(5),
                          //   ),
                          //   margin: const EdgeInsets.all(10),
                          //   padding: const EdgeInsets.symmetric(vertical: 20),
                          //   child: Text(''),
                          // )
                        ],
                      ),

                    ],
                  ),
                )),


            const SizedBox(
              height: 10,
            ),
            Container(
                decoration: BoxDecoration(
                  color: AppColor.appColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      const Text(
                        'আজকের নামাজের সময়সূচী',
                        style: TextStyle(
                            color: AppColor.fontColor,
                            fontSize:25,
                            fontWeight: FontWeight.w600),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      Text(
                        'ফজর- ${TimeFormat(timeString: _controller.prayerTimes['Fajr']).timeConvert()} মি:',
                        style: const TextStyle(
                            color: AppColor.fontColor,
                            fontSize:15,
                            fontWeight: FontWeight.w600),
                      ),


                      Text(
                        'যোহর: ${TimeFormat(timeString: _controller.prayerTimes['Dhuhr']).timeConvert()} মি:',
                        style: const TextStyle(
                            color: AppColor.fontColor,
                            fontSize:15,
                            fontWeight: FontWeight.w600),
                      ),

                      Text(
                        'আসর: ${TimeFormat(timeString: _controller.prayerTimes['Asr']).timeConvert()} মি:',
                        style: const TextStyle(
                            color: AppColor.fontColor,
                            fontSize:15,
                            fontWeight: FontWeight.w600),
                      ),

                      Text(
                        'মাগরিব: ${TimeFormat(timeString: _controller.prayerTimes['Maghrib']).timeConvert()} মি:',
                        style: const TextStyle(
                            color: AppColor.fontColor,
                            fontSize:15,
                            fontWeight: FontWeight.w600),
                      ),

                      Text(
                        'এশা: ${TimeFormat(timeString: _controller.prayerTimes['Isha']).timeConvert()} মি:',
                        style: const TextStyle(
                            color: AppColor.fontColor,
                            fontSize:15,
                            fontWeight: FontWeight.w600),
                      ),

                    ],
                  ),
                )),

          ],
        ),
      ),


      bottomNavigationBar:const customBottomBar(),
    );
  }
}
