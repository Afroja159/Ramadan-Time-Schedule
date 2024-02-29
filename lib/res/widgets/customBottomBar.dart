import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramadantime/res/colors/app_color.dart';
import 'package:ramadantime/res/routes/route_name.dart';
import 'package:ramadantime/view-models/controller/place_controller.dart';

class customBottomBar extends StatelessWidget {
  const customBottomBar({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final PlaceController _controller=Get.put(PlaceController());
    print(Get.currentRoute);
    return BottomNavigationBar(
      backgroundColor: Colors.green[200],
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(icon:InkWell(
            onTap: (){
              Get.offNamed(RouteName.homeScreen);
            },
            child:Get.currentRoute==RouteName.homeScreen ? Icon(Icons.home,color:AppColor.appColor,):Icon(Icons.home,color: Colors.black,)),label:'Home',
        ),
        BottomNavigationBarItem(icon:InkWell(onTap: (){
          Get.toNamed(RouteName.calender);
        },
            child: Get.currentRoute==RouteName.calender ? Icon(Icons.calendar_month,color:AppColor.appColor,):Icon(Icons.calendar_month,color:Colors.black)) ,label:'Calendar'),
        BottomNavigationBarItem(icon:InkWell(onTap: (){
          _controller.savedPlaceGetting();
          if(_controller.savedPlace ==''){
            Get.toNamed(RouteName.placeSelection);
          }else{
            Get.toNamed(RouteName.prayer_time);
          }

        },child:Get.currentRoute==RouteName.prayer_time ? Icon(Icons.watch_later_outlined,color:AppColor.appColor,):Icon(Icons.watch_later_outlined,color:Colors.black)) ,label:'Time'),

        BottomNavigationBarItem(icon:InkWell(onTap:(){
          Get.toNamed(RouteName.settings);
        },child: Get.currentRoute==RouteName.settings ? Icon(Icons.settings,color:AppColor.appColor,):Icon(Icons.settings,color:Colors.black)) ,label:'Settings'),
      ],
    );
  }
}