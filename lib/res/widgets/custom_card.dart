import 'package:flutter/material.dart';
import 'package:ramadantime/view-models/controller/place_controller.dart';
import 'package:get/get.dart';
import 'package:ramadantime/res/colors/app_color.dart';
import 'package:ramadantime/res/routes/route_name.dart';

class CustomCard extends StatelessWidget {
  String latitude;
  String longitude;
  String place;
  PlaceController controller;
  CustomCard({
    required this.latitude,
    required this.longitude,
    required this.place,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () async {
          await controller.savePlace(latitude, longitude, place);
          Get.toNamed(RouteName.prayer_time);
        },
        child: Container(
            margin: EdgeInsets.all(5),
            width: MediaQuery.sizeOf(context).width / 2,
            height: MediaQuery.sizeOf(context).width / 4,
            decoration: BoxDecoration(
              color: AppColor.fontColor,
              border: Border.all(
                  width: 2, color: AppColor.appColor, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
                child: Text(
              place,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:AppColor.appColor ),
            ))),
      ),
    );
  }
}
