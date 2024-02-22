import 'package:flutter/material.dart';
import 'package:ramadantime/res/colors/app_color.dart';
import 'package:ramadantime/view/home/Time_View.dart';
import 'package:ramadantime/view/home/home_page.dart';
import 'package:ramadantime/view/place/place_selection.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  // List of pages corresponding to each item in the bottom navigation bar
  final List<Widget> _pages = [
    Text('Settings'),
    TimeView(),
    PlaceSelection(),
    Text('Settings'),
  ];

  // Function to handle item selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.appColor,
          title: const Text(
            'Home',
            style: TextStyle(color: AppColor.fontColor),
          ),
        ),


      body: _pages[_selectedIndex],
      bottomNavigationBar:BottomNavigationBar(
        backgroundColor:Colors.amber,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,

        items: [
          BottomNavigationBarItem(icon:Icon(Icons.home,color:Colors.black,),label:'Home',),
          BottomNavigationBarItem(icon:Icon(Icons.calendar_month,color:Colors.black) ,label:'Home'),
          BottomNavigationBarItem(icon:Icon(Icons.watch_later_outlined,color:Colors.black) ,label:'Home'),
          BottomNavigationBarItem(icon:Icon(Icons.settings,color:Colors.black) ,label:'Home'),
        ],
      ),

    );
  }
}
