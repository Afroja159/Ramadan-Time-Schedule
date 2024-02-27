import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:ramadantime/res/routes/route.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  // Initialize Bangla locale data for date formatting
  await initializeDateFormatting('bn', null);
  // Load the theme mode
  bool? isDarkMode = await _loadThemeMode();
  runApp(MyApp(isDarkMode: isDarkMode ?? false));
}
Future<bool?> _loadThemeMode() async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isDarkMode');
  } catch (e) {
    print('Error loading theme mode: $e');
    return null; // Return null if any error occurs
  }
}

class MyApp extends StatelessWidget {
  final bool isDarkMode;
  const MyApp({Key? key, required this.isDarkMode}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ramadan Time Table',
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      getPages: AppRoutes.appRoutes(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English
        const Locale('bn', ''), // Bangla
      ],
    );
  }
}


