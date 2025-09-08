import 'package:flutter/material.dart';
import 'package:lms_app/screens/Home_Screen/home_screen.dart';

import 'Alert_Screens/alert_screens.dart';
import 'Profile_Screens/profile_screens.dart';
import 'Chat_Screens/Chat_Screens.dart';

// ---------------- MAIN PAGE WITH NAVIGATION ----------------
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
    Chat_Screens(),
    profile_screen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
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
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chats"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")


        ],
      ),
    );
  }
}

// ---------------- HOME SCREEN ----------------
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Top Section
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/img/ppookjsid.jpg'),
              fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
            padding: const EdgeInsets.only(top: 60, bottom: 20, left: 20, right: 20),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/img/47115f390c01d9a90d4c76c8b34f8064.jpg"),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Rudra Prasad",
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text("7th sem (Final Year)\nComputer Science & Engg",
                        style: TextStyle(color: Colors.white70, fontSize: 14)),
                    SizedBox(height: 4),
                    Text("20180123453", style: TextStyle(color: Colors.white, fontSize: 13)),
                  ],
                )
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Dashboard + Events
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(15),
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 1.3,
                    children: const [
                      _DashboardCard(title: "Academic Info", icon: Icons.school),
                      _DashboardCard(title: "Assignments", icon: Icons.assignment),
                      _DashboardCard(title: "Time Table", icon: Icons.table_chart),
                      _DashboardCard(title: "Upcoming Event", icon: Icons.event),
                      _DashboardCard(title: "View Results", icon: Icons.assessment, fullWidth: true),
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
                            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
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
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- ALERTS SCREEN ----------------
class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("🔔 Alerts Page", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

// ---------------- PROFILE SCREEN ----------------
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("👤 Profile Page", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

// ---------------- DASHBOARD CARD ----------------
class _DashboardCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool fullWidth;

  const _DashboardCard({required this.title, required this.icon, this.fullWidth = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: fullWidth ? double.infinity : null,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 8, spreadRadius: 2)],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30, color: Colors.blue),
          const SizedBox(height: 15),
          Text(title,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black87),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class Chat_Screen extends StatelessWidget {
  const Chat_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

    );
  }
}