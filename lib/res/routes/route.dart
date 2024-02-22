import 'package:get/get.dart';
import 'package:ramadantime/res/routes/route_name.dart';
import 'package:ramadantime/view/calender/calender.dart';
import 'package:ramadantime/view/home/Time_View.dart';
import 'package:ramadantime/view/home/dua.dart';
import 'package:ramadantime/view/home/home_page.dart';
import 'package:ramadantime/view/home/home_view.dart';
import 'package:ramadantime/view/place/place_selection.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.homeScreen,
          page: () => HomePage(),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.placeSelection,
          page: () => PlaceSelection(),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.prayer_time,
          page: () => TimeView(),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
    GetPage(
      name: RouteName.dua,
      page: () => Dua(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: RouteName.calender,
      page: () => Calender(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
      ];
}
