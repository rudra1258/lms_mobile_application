  import 'package:flutter/material.dart';
  import 'package:lms_app/screens/Home_Screen/academic_info_screen.dart';
  import 'package:lms_app/screens/Home_Screen/assignments_screen.dart';
  import 'package:lms_app/screens/Home_Screen/daily_class_screen.dart';
  import 'package:lms_app/screens/Home_Screen/library_screen.dart';
  import 'package:lms_app/screens/Home_Screen/manage_leaves_screen.dart';
  import 'package:lms_app/screens/Home_Screen/new_academic_info_screen.dart';
  import 'package:lms_app/screens/Home_Screen/new_library_screen.dart';
  import 'package:lms_app/screens/Home_Screen/new_syllabus_screen.dart';
  import 'package:lms_app/screens/Home_Screen/notice_and_event_screen.dart';
  import 'package:lms_app/screens/Home_Screen/syllabus_screen.dart';

  class home_screen extends StatelessWidget {
    const home_screen({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Stack(
          children: [
            // ✅ Background image with 0.67 opacity
            Container(
              child: Opacity(
                opacity: 0.67,
                child: Image.asset(
                  "assets/img/Picsart_25-08-21_15-14-30-585.jpg",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),

            // ✅ Foreground content
            SingleChildScrollView(
              child: Column(
                children: [
                  // Header
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
                      image: DecorationImage(
                        image: AssetImage("assets/img/ppookjsid.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    padding: const EdgeInsets.only(top: 40, bottom: 20, left: 20, right: 20),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                            "assets/img/47115f390c01d9a90d4c76c8b34f8064.jpg",
                          ),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Rudra Prasad",
                                style: TextStyle(
                                    color: Colors.grey[900],
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            const Text("7th sem (Final Year)\nComputer Science & Engg",
                                style: TextStyle(color: Colors.black87, fontSize: 14)),
                            const SizedBox(height: 4),
                            const Text("20180123453",
                                style: TextStyle(color: Colors.black, fontSize: 13)),
                          ],
                        )
                      ],
                    ),
                  ),

                  // Dashboard + Events
                  Column(
                    children: [
                      GridView.count(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        padding: const EdgeInsets.all(15),
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 1.3,
                        children: [
                          _DashboardCard(
                            title: "Academic Info",
                            icon: Icons.school,
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => new_academic_info_screen(),));
                            },
                          ),
                          _DashboardCard(
                            title: "Assignments",
                            icon: Icons.assignment,
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => assignments_screen() ));
                            },
                          ),
                          _DashboardCard(
                            title: "Daily Class",
                            icon: Icons.table_chart,
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => daily_class_screen(),));
                            },
                          ),
                          _DashboardCard(
                            title: "Library",
                            icon: Icons.book,
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => new_library_screen(),));
                            },
                          ),
                          _DashboardCard(
                            title: "Syllabus",
                            icon: Icons.route,
                            fullWidth: true,
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => new_syllabus_screen(),)
                              );
                            },
                          ),
                          _DashboardCard(
                            title: "Notice & Events",
                            icon: Icons.campaign,
                            fullWidth: true,
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => notice_and_event_screen(),));
                            },
                          ),
                          // _DashboardCard(
                          //   title: "Manage Leaves",
                          //   icon: Icons.event_available,
                          //   onTap: () {
                          //     Navigator.push(context, MaterialPageRoute(builder: (context) => manage_leaves_screen())
                          //     );
                          //   },
                          // ),
                        ],
                      ),

                      // Events Section
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: const LinearGradient(
                            colors: [Color(0xFF42A5F5), Color(0xFF7E57C2)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Events",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            const Text(
                              "AICTE supported Unique Mega Quiz Contest at Industry by Academia Conclave at India International Science Festival (IISF 2020)",
                              style: TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: TextButton(
                                onPressed: () {},
                                child: const Text("View All",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }

  // ---------------- DASHBOARD CARD ----------------
  class _DashboardCard extends StatelessWidget {
    final String title;
    final IconData icon;
    final bool fullWidth;
    final VoidCallback? onTap; // ✅ Added onTap

    const _DashboardCard({
      required this.title,
      required this.icon,
      this.fullWidth = false,
      this.onTap,
    });

    @override
    Widget build(BuildContext context) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: fullWidth ? double.infinity : null,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade700,
                blurRadius: 8,
                spreadRadius: 2,
              )
            ],
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 30, color: Colors.orangeAccent),
              const SizedBox(height: 15),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }
  }
