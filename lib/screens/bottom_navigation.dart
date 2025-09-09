import 'package:flutter/material.dart';
import 'package:lms_app/screens/Home_Screen/home_screen.dart';

import 'Alert_Screens/alert_screens.dart';
import 'Profile_Screens/profile_screens.dart';
import 'Chat_Screens/Chat_Screens.dart';

class bottom_navigation_screen extends StatefulWidget {
  const bottom_navigation_screen({super.key});

  @override
  State<bottom_navigation_screen> createState() => _bottom_navigation_screenState();
}

class _bottom_navigation_screenState extends State<bottom_navigation_screen> {
  int _selectedIndex = 0;

  // Pages
  final List<Widget> _pages = const [
    home_screen(),
    alert_screen(),
    profile_screen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        selectedIconTheme:IconThemeData(size: 30) ,
        selectedFontSize: 16,
        unselectedFontSize: 12,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Alerts"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")


        ],
      ),
    );
  }
}

