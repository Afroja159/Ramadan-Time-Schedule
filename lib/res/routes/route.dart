import 'package:get/get.dart';
import 'package:ramadantime/res/routes/route_name.dart';
import 'package:ramadantime/view/calender/calender_screen.dart';
import 'package:ramadantime/view/home/Time_View.dart';
import 'package:ramadantime/view/home/dua_screen.dart';
import 'package:ramadantime/view/home/home_page.dart';
import 'package:ramadantime/view/home/home_view.dart';
import 'package:ramadantime/view/place/place_selection.dart';
import 'package:ramadantime/view/settings/settings_screen.dart';

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
      page: () => DuaScreen(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: RouteName.calender,
      page: () => CalenderScreen(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: RouteName.settings,
      page: () => SettingsScreen(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
      ];
}
