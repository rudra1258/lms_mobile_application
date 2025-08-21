import 'dart:ui';

import 'package:flutter/material.dart';

class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/img/ppookjsid.jpg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Column(
                    spacing: 5,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Welcome Back !",
                        style: TextStyle(
                          letterSpacing: 1.3,
                          color: Colors.white,
                          fontSize: width * 0.1,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Sen",
                        ),
                      ),
                      Text("Enter Personal Details To Your\nStudent Account",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          letterSpacing: 1.3,
                          color: Colors.white,
                          fontSize: width * 0.036,
                          // fontSize: 12,
                          // fontWeight: FontWeight.bold,
                          fontFamily: "Delius",
                        ),
                      ),
                    ],
                  ),
              ),

              Row(
                spacing: 15,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // Adjust blur intensity
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent, // Semi-transparent background for frosted effect
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                              ),
                            ),
                            elevation: 0, // Remove shadow for cleaner look
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.045,
                                // fontWeight: FontWeight.bold,
                                fontFamily: "Sen",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                            ), // Set desired border radius
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Text("Sign Up",
                            style: TextStyle(
                              color: Colors.blue[900],
                              fontSize: width * 0.045,
                              // fontWeight: FontWeight.bold,
                              fontFamily: "Sen",
                            ),
                          ),
                        )
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
