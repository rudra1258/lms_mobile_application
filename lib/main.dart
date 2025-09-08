import 'package:flutter/material.dart';
import 'package:lms_app/screens/bottom_navigation.dart';
import 'package:lms_app/screens/splash_screen.dart';
import 'package:lms_app/screens/bottom_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: splash_screen(),
    );
  }
}