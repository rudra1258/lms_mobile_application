import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lms_app/values/value.dart';

import 'authentication/welcome_screen.dart';

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
      if(isLoggedIn == null){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => login_screen(),));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            height: 300,
            width: 300,
            child: Image.asset("assets/img/Picsart_25-08-22_11-12-49-231.png")),
      ),
    );
  }
}
