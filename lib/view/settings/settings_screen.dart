import 'package:flutter/material.dart';
import 'package:ramadantime/res/colors/app_color.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late bool _isDarkMode;

  @override
  void initState() {
    super.initState();
    _loadThemeMode();
  }

  Future<void> _loadThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    });
  }
  Future<void> _toggleTheme(bool value) async {
    print('Toggle theme called with value: $value');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = value;
    });
    prefs.setBool('isDarkMode', value);
    print('Theme mode set to: $value');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: AppColor.appColor,
      iconTheme: const IconThemeData(color: AppColor.fontColor),
      title: const Text(
        'সেটিংস',
        style: TextStyle(color: AppColor.fontColor),
      ),
      centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'ডার্ক মোড',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColor.appColor ),

            ),
            Switch(
              value: _isDarkMode,
              onChanged: (value) {
                _toggleTheme(value);
              },
              activeTrackColor: Colors.lightGreen, // Color of the track when active
              activeColor: AppColor.appColor, // Color of the button when active
              inactiveThumbColor: Colors.grey, // Color of the button when inactive
              inactiveTrackColor: Colors.grey.withOpacity(0.5), // Color of the track when inactive
            ),
          ],
        ),
      ),
    );
  }
}
