
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../colors/app_color.dart';

class CustomCardSimple extends StatelessWidget {

  String routeName;
  String name;
  CustomCardSimple({required this.routeName,required this.name});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: ()  {
          Get.toNamed(routeName);
        },
        child: Container(
            margin:const EdgeInsets.all(5),
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
                  name,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:AppColor.appColor ),
                ))),
      ),
    );
  }
}
