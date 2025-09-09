import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'signup_screen.dart';
import 'login_screen.dart';

class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  // late VideoPlayerController _controller;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    // _controller = VideoPlayerController.asset('assets/videos/welcome_video.mp4')
    //   ..initialize().then((_) {
    //     setState(() {}); // Update UI when video is initialized
    //     _controller.play();
    //     _controller.setLooping(true);
    //   }).catchError((error) {
    //     setState(() {
    //       _errorMessage = error.toString();
    //        print('Video initialization error: $error');
    //     });
    //   });
  }

  // @override
  // void dispose() {
  //   _controller.dispose(); // Dispose of the controller to free resources
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Video background
          // AspectRatio(
          //   aspectRatio: 9.0/20.0,
          //   child: VideoPlayer(_controller),
          // ),

          // Semi-transparent overlay
          Container(
            color: Colors.black.withOpacity(0.5),
          ),

          // Foreground content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  spacing: 5,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Get Started !",
                      style: TextStyle(
                        letterSpacing: 1.3,
                        color: Colors.white,
                        fontSize: width * 0.1,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Sen",
                      ),
                    ),
                    Text(
                      "Enter Personal Details To Your\nStudent Account",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 1.3,
                        color: Colors.white,
                        fontSize: width * 0.036,
                        fontFamily: "Delius",
                      ),
                    ),
                  ],
                ),
              ),

              // Buttons
              Row(
                spacing: 15,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => loginscreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                              ),
                            ),
                            elevation: 0,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.045,
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignUpScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.blue[900],
                            fontSize: width * 0.045,
                            fontFamily: "Sen",
                          ),
                        ),
                      ),
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
