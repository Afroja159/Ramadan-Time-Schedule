import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:ramadantime/res/routes/route.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // Initialize Bangla locale data for date formatting
  await initializeDateFormatting('bn', null);

  // Load the theme mode or default to light mode
  bool? isDarkMode = await _loadThemeMode();

  // If isDarkMode is not set (null), default to light mode
  if (isDarkMode == null) {
    isDarkMode = false;
  }

  runApp(MyApp(isDarkMode: isDarkMode));
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

Future<void> _saveThemeMode(bool isDarkMode) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode);
  } catch (e) {
    print('Error saving theme mode: $e');
  }
}

class MyApp extends StatefulWidget {
  final bool isDarkMode;

  const MyApp({Key? key, this.isDarkMode = false}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
  // Static method to access _MyAppState from any context
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  late bool _isDarkMode;

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.isDarkMode;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ramadan Time Table',
      debugShowCheckedModeBanner: false,
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),

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

  void updateTheme(bool isDarkMode) {
    setState(() {
      _isDarkMode = isDarkMode;
    });
  }
}

