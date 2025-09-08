import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {
  bool agree = false;

  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 4), // start from bottom
      end: Offset.zero, // move to normal position
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    _controller.forward(); // 👈 run animation on screen load
  }

  // void _refreshAnimation() {
  //   _controller.reset();
  //   _controller.forward();
  // }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          // IconButton(
          //   icon: const Icon(Icons.refresh, color: Colors.white),
          //   onPressed: _refreshAnimation, // 👈 replay animation
          // )
        ],
      ),
      body: Stack(
        children: [
          /// Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/ppookjsid.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// Animated Form contentd
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 200), // spacing from top
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SlideTransition(
                    position: _slideAnimation, // 👈 applied animation here
                    child: Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                        minHeight:
                        MediaQuery.of(context).size.height - 200, // fills remaining height
                      ),
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 30,
                            offset: Offset(0, -4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Title
                          const Center(
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          /// Full Name
                          const TextField(
                            decoration: InputDecoration(
                              labelText: "Full Name",
                              hintText: "Enter Full Name",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 15),

                          /// Email
                          const TextField(
                            decoration: InputDecoration(
                              labelText: "Email",
                              hintText: "Enter Email",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 15),

                            const TextField(
                              keyboardType: TextInputType.number,
                              maxLength: 10,
                              decoration: InputDecoration(
                                labelText: "Phone no",
                                hintText: "Enter Phone No",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          const SizedBox(height: 15),

                          /// Password
                          const TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "Password",
                              hintText: "Enter Password",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 10),

                          /// Checkbox
                          Row(
                            children: [
                              Checkbox(
                                value: agree,
                                onChanged: (val) {
                                  setState(() => agree = val!);
                                },
                              ),
                              const Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    text: "I agree to the processing of ",
                                    children: [
                                      TextSpan(
                                        text: "Personal data",
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          /// Signup Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding:
                                const EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Sign up",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          /// Social buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              _socialImage('assets/img/google png.png'),
                              const SizedBox(width: 20),
                            ],
                          ),

                          const SizedBox(height: 20),

                          /// Already account
                          Center(
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Already have an account? Sign in",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Helper for social buttons
  Widget _socialImage(String assetPath) {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: ClipOval(
        child: Image.asset(
          assetPath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
