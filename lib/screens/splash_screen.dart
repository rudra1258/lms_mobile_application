import 'dart:async';

import 'package:flutter/material.dart';

import 'authentication/login_screen.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Delay splash for 3 seconds then navigate
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  login_screen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/img/learning-management-system-removebg-preview.png"),
      ),
    );
  }
}
