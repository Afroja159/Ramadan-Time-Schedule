import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramadantime/res/colors/app_color.dart';
import 'package:ramadantime/res/routes/route_name.dart';
import 'package:ramadantime/res/widgets/customBottomBar.dart';
import 'package:ramadantime/res/widgets/custom_card.dart';
import 'package:ramadantime/res/widgets/custom_card_2.dart';
import 'package:ramadantime/view-models/controller/place_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PlaceController _controller = Get.put(PlaceController());

  @override
  void initState() {
    // TODO: implement initState
    // _controller.getDivisions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.appColor,
          iconTheme: IconThemeData(color: AppColor.fontColor),
          title: const Text(
            'হোম',
            style: TextStyle(color: AppColor.fontColor),
          ),
          centerTitle: true,
        ),

        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 5),
          child: Column(
            children: [
              Row(
                children: [
                  CustomCard(
                      latitude: '23.78062070',
                      longitude: '90.34928600',
                      place: 'ঢাকা',
                      controller: _controller),
                  CustomCard(
                      latitude: '22.35685100',
                      longitude: '91.78318200',
                      place: 'চট্টগ্রাম',
                      controller: _controller)
                ],
              ),
              Row(
                children: [
                  CustomCard(
                      latitude: '24.36358900',
                      longitude: '88.62413500',
                      place: 'রাজশাহী',
                      controller: _controller),
                  CustomCard(
                      latitude: '22.84564100',
                      longitude: '89.54032800',
                      place: 'খুলনা',
                      controller: _controller)
                ],
              ),
              Row(
                children: [
                  CustomCard(
                      latitude: '24.89492900',
                      longitude: '91.86870600',
                      place: 'সিলেট',
                      controller: _controller),
                  CustomCard(
                      latitude: '22.70100200',
                      longitude: '90.35345100',
                      place: 'বরিশাল',
                      controller: _controller)
                ],
              ),

              Row(
                children: [
                  CustomCard(
                      latitude: '25.74389200',
                      longitude: '89.27522700',
                      place: 'রংপুর',
                      controller: _controller),
                  CustomCard(
                      latitude: '24.74714900',
                      longitude: '90.42027300',
                      place: 'ময়মনসিংহ',
                      controller: _controller)
                ],
              ),

              Row(
                children: [
                 CustomCardSimple(routeName:RouteName.placeSelection, name: 'স্থান নির্বাচন করুন'),
                  CustomCardSimple(routeName:RouteName.dua, name: 'দোয়া'),

                ],
              ),
            ],
          ),
        ),

      bottomNavigationBar:customBottomBar(),

    );

  }


}

