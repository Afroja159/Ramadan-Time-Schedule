import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ramadantime/res/colors/app_color.dart';
import 'package:ramadantime/res/widgets/customBottomBar.dart';
import 'package:ramadantime/view-models/controller/calender_controller.dart';


class CalenderScreen extends StatefulWidget {
  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  final CalenderController controller = Get.put(CalenderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColor.appColor,
        iconTheme: const IconThemeData(color: AppColor.fontColor),
        title: const Text(
          'ক্যালেন্ডার',
          style: TextStyle(color: AppColor.fontColor),
        ),
        centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Obx(() {
          if (controller.calenderTimes.isEmpty) {
            return const Center(child: CircularProgressIndicator(
              color: AppColor.appColor,
            ));
          } else {
            return TimeTable(prayerTimes: controller.calenderTimes);
          }
        }),
      ),
      bottomNavigationBar: const customBottomBar(),
    );
  }
}

class TimeTable extends StatelessWidget {
  final List<Map<String, dynamic>> prayerTimes;

  const TimeTable({Key? key, required this.prayerTimes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Table(
        border: TableBorder.all(),
        columnWidths: const {
          0: FlexColumnWidth(1),
          1: FlexColumnWidth(1),
          2: FlexColumnWidth(1),
          3: FlexColumnWidth(1),
        },
        children: _buildTableRows(),
      ),
    );
  }

  List<TableRow> _buildTableRows() {
    List<TableRow> rows = [];

    // Add header row
    rows.add(
      TableRow(
        decoration: BoxDecoration(
          color: AppColor.appColor.withOpacity(0.2),
        ),
        children: const [
          TableCell(child: Center(child: Padding(
            padding: EdgeInsets.all(18.0),
            child: Text('তারিখ', textAlign: TextAlign.center ,style: TextStyle(fontSize: 14, color: AppColor.appColor, fontWeight: FontWeight.w600),),
          ))),
          TableCell(child: Center(child: Padding(
            padding: EdgeInsets.all(18.0),
            child: Text('বার',textAlign: TextAlign.center , style: TextStyle(fontSize: 14, color: AppColor.appColor, fontWeight: FontWeight.w600),),
          ))),
          TableCell(child: Center(child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('সেহরির সময়', textAlign: TextAlign.center ,style: TextStyle(fontSize: 14, color: AppColor.appColor, fontWeight: FontWeight.w600),),
          ))),
          TableCell(child: Center(child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('ইফতারের সময়',textAlign: TextAlign.center , style: TextStyle(fontSize: 14, color: AppColor.appColor, fontWeight: FontWeight.w600),),
          ))),
        ],
      ),
    );

    for (var prayerTime in prayerTimes) {
      final date = _convertToBanglaDate(prayerTime['date']['readable']);
      final weekday = _convertToBanglaWeekday(prayerTime['date']['gregorian']['weekday']['en']);
      final fajrTime = _convertToBanglaTime(prayerTime['timings']['Fajr']);
      final maghribTime = _convertToBanglaTime(prayerTime['timings']['Maghrib']);

      rows.add(
        TableRow(
          children: [
            TableCell(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(date),
                ),
              ),
            ),
            TableCell(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(weekday),
                ),
              ),
            ),
            TableCell(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('$fajrTime মি:'),
                ),
              ),
            ),
            TableCell(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('$maghribTime মি:'),
                ),
              ),
            ),
          ],
        ),

      );
    }

    return rows;
  }
  String _convertToBanglaDate(String date) {
    final List<String> parts = date.split(' ');
    final String day = _convertNumeralsToBangla(parts[0]);
    final String month = parts[1];
    final String year = _convertNumeralsToBangla(parts[2]);
    // Convert month to Bangla
    final Map<String, String> monthMap = {
      'Jan': 'জানুয়ারি',
      'Feb': 'ফেব্রুয়ারি',
      'Mar': 'মার্চ',
      'Apr': 'এপ্রিল',
      'May': 'মে',
      'Jun': 'জুন',
      'Jul': 'জুলাই',
      'Aug': 'আগস্ট',
      'Sep': 'সেপ্টেম্বর',
      'Oct': 'অক্টোবর',
      'Nov': 'নভেম্বর',
      'Dec': 'ডিসেম্বর',
    };
    return '$day ${monthMap[month]} $year';
  }

  String _convertNumeralsToBangla(String englishNumerals) {
    final Map<String, String> numeralsMap = {
      '0': '০',
      '1': '১',
      '2': '২',
      '3': '৩',
      '4': '৪',
      '5': '৫',
      '6': '৬',
      '7': '৭',
      '8': '৮',
      '9': '৯',
    };
    return englishNumerals.split('').map((char) => numeralsMap[char]).join('');
  }

  String _convertToBanglaWeekday(String weekday) {
    final Map<String, String> weekdayMap = {
      'Monday': 'সোমবার',
      'Tuesday': 'মঙ্গলবার',
      'Wednesday': 'বুধবার',
      'Thursday': 'বৃহস্পতিবার',
      'Friday': 'শুক্রবার',
      'Saturday': 'শনিবার',
      'Sunday': 'রবিবার',
    };
    return weekdayMap[weekday] ?? weekday;
  }

  String _convertToBanglaTime(String time) {
    // Remove the '(+X)' part from the time string
    final cleanedTime = time.replaceAll(RegExp(r'\s*\(.*?\)'), '');

    // Parse the time string to a DateTime object
    final dateTime = DateFormat('HH:mm').parse(cleanedTime);

    // Convert the DateTime object to 12-hour format
    final formattedTime = DateFormat('h:mm ').format(dateTime);

    // Convert the formatted time to Bangla digits
    return formattedTime.replaceAllMapped(RegExp(r'\b\d+\b'), (match) {
      final intNumber = int.parse(match.group(0)!);
      final List<String> banglaDigits = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
      return intNumber.toString().split('').map((digit) => banglaDigits[int.parse(digit)]).join('');
    });
  }


}
