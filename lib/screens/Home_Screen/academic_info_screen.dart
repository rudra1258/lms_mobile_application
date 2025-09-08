import 'package:flutter/material.dart';

class academic_info_screen extends StatefulWidget {
  const academic_info_screen({super.key});

  @override
  State<academic_info_screen> createState() => _academic_info_screenState();
}

class _academic_info_screenState extends State<academic_info_screen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // ✅ Background behind AppBar
      appBar: AppBar(
        title: const Text.rich(
          TextSpan(
            text: "Academic ",
            style: TextStyle(color: Colors.black, fontSize: 20),
            children: [
              TextSpan(
                text: "Information",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
       toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          labelColor: Colors.green,
          unselectedLabelColor: Colors.black54,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            color: Colors.blue.shade100,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 8,
                spreadRadius: 1,
                offset: const Offset(0, 9),
              ),
            ],
          ),
          tabs: const [
            Tab(text: "Student Info"),
            Tab(text: "Courses"),
            Tab(text: "Attendance"),
            Tab(text: "Results"),
            Tab(text: "Exams"),
          ],
        ),
      ),

      body: Stack(
        children: [
          // ✅ Background image with opacity
          Opacity(
            opacity: 0.3,
            child: Image.asset(
              'assets/img/Picsart_25-08-21_15-14-30-585.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          // ✅ Tab Views with padding to avoid overlap
          Padding(
            padding: const EdgeInsets.only(top: 120), // 👈 shifts below AppBar+Tabs
            child: TabBarView(
              controller: _tabController,
              physics: const PageScrollPhysics(),
              children: [
                _buildTileGrid([
                  {"title": "Name", "value": "Rudra Prasad"},
                  {"title": "Roll Number", "value": "CSE2023-045"},
                  {"title": "Program", "value": "B.Tech CSE"},
                  {"title": "Semester", "value": "5th"},
                ]),
                _buildTileGrid([
                  {"title": "CS501", "value": "DBMS"},
                  {"title": "CS502", "value": "Operating Systems"},
                  {"title": "CS503", "value": "Computer Networks"},
                  {"title": "CS504", "value": "Software Engineering"},
                ]),
                _buildTileGrid([
                  {"title": "DBMS", "value": "85%"},
                  {"title": "OS", "value": "92%"},
                  {"title": "Networks", "value": "78%"},
                  {"title": "Software Engg", "value": "88%"},
                ]),
                _buildTileGrid([
                  {"title": "DBMS", "value": "A"},
                  {"title": "OS", "value": "B+"},
                  {"title": "Networks", "value": "A"},
                  {"title": "Software Engg", "value": "A+"},
                  {"title": "CGPA", "value": "8.5"},
                ]),
                _buildTileGrid([
                  {"title": "Mid Term", "value": "10th Sept 2025"},
                  {"title": "Lab Practical", "value": "18th Sept 2025"},
                  {"title": "End Term", "value": "1st Dec 2025"},
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ✅ Helper function for Tile/Grid style
  Widget _buildTileGrid(List<Map<String, String>> items) {
    return GridView.builder(
      padding: const EdgeInsets.all(26),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.5,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.blue.shade400.withOpacity(0.85), // ✅ Transparency for background visibility
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: const Offset(2, 2),
              )
            ],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  items[index]["title"]!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  items[index]["value"]!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
