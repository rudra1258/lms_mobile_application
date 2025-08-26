import 'package:flutter/material.dart';

class forgot_password extends StatefulWidget {
  const forgot_password({super.key});

  @override
  State<forgot_password> createState() => _forgot_passwordState();
}

class _forgot_passwordState extends State<forgot_password>
    with SingleTickerProviderStateMixin {
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
      begin: const Offset(0, 4),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    _controller.forward();
  }

  void _refreshAnimation() {
    _controller.reset();
    _controller.forward();
  }

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
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: _refreshAnimation,
          )
        ],
      ),
      body: Stack(
        children: [
          /// Background
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/ppookjsid.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// Animated form
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 200),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                        minHeight:
                        MediaQuery.of(context).size.height - 200,
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          /// Title
                          const Text(
                            "Forgot Password",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),

                          const SizedBox(height: 20),

                          /// Info text
                          const Text(
                            "Enter your email address below and we’ll send you instructions to reset your password.",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black54),
                          ),

                          const SizedBox(height: 20),

                          /// Email field
                          const TextField(
                            decoration: InputDecoration(
                              labelText: "Email",
                              hintText: "Enter your email",
                              border: OutlineInputBorder(),
                            ),
                          ),

                          const SizedBox(height: 20),

                          /// Reset button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {
                                // handle reset
                              },
                              child: const Text(
                                "Send Reset Link",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          /// Back to login
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Back to Login",
                              style: TextStyle(color: Colors.blue),
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
}
