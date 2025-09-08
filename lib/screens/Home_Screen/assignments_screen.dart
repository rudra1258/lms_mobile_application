import 'package:flutter/material.dart';

class assignments_screen extends StatefulWidget {
  const assignments_screen({super.key});

  @override
  State<assignments_screen> createState() => _assignments_screenState();
}

class _assignments_screenState extends State<assignments_screen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // ✅ allows image behind AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // transparent to see image
        elevation: 0,

        // ✅ Title in exact center
        title: const Text.rich(
          TextSpan(
            text: "Your ",
            style: TextStyle(color: Colors.black, fontSize: 20),
            children: [
              TextSpan(
                text: "Assignments",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center, // ✅ Ensures center alignment
        ),
        centerTitle: true, // ✅ Enforces center alignment

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Align(
            alignment: Alignment.center, // ✅ Center alignment
            child: TabBar(
              indicatorAnimation: TabIndicatorAnimation.elastic,
              controller: _tabController,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.black54,
              indicatorColor: Colors.blue,
              isScrollable: false, // ✅ Important → evenly spreads tabs
              tabs: const [
                Tab(text: "Due"),
                Tab(text: "Submitted"),
                Tab(text: "All"),
              ],
            ),
          ),
        ),


      ),


      // ✅ Stack -> Background Image + Foreground Content
      body: Stack(
        children: [
          // ✅ Background Image
          Opacity(
            opacity: 0.3, // 👈 adjust this for dimming
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/img/Picsart_25-08-21_15-14-30-585.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // ✅ Foreground Content
          TabBarView(
            controller: _tabController,
            children: [
              // Due tab
              ListView(
                padding: const EdgeInsets.fromLTRB(15, 150, 15, 15),
                children: const [
                  AssignmentCard(
                    teacher: "Mr. Thomas",
                    subject: "Science",
                    title: "Self Check Quiz",
                    dueDate: "30/04/2021",
                    remaining: "in 2 days",
                  ),
                  AssignmentCard(
                    teacher: "Mr. Thomas",
                    subject: "Science",
                    title: "Self Check Quiz II",
                    dueDate: "14/05/2021",
                    remaining: "in 16 days",
                  ),
                  AssignmentCard(
                    teacher: "Mrs. Jane",
                    subject: "Geography",
                    title: "Atlas Mountains Map",
                    dueDate: "16/04/2021",
                    remaining: "in 18 days",
                  ),
                ],
              ),

              // Submitted tab
              const Center(child: Text("Submitted Assignments")),

              // All tab
              const Center(child: Text("All Assignments")),
            ],
          ),
        ],
      ),
    );
  }
}

// ---------------- Assignment Card ----------------
class AssignmentCard extends StatelessWidget {
  final String teacher;
  final String subject;
  final String title;
  final String dueDate;
  final String remaining;

  const AssignmentCard({
    super.key,
    required this.teacher,
    required this.subject,
    required this.title,
    required this.dueDate,
    required this.remaining,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8), // ✅ translucent card
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 2,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          // Left Side Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                    children: [
                      TextSpan(
                        text: teacher,
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(text: " posted • in "),
                      TextSpan(
                        text: subject,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "DUE $dueDate",
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  remaining,
                  style: const TextStyle(color: Colors.black54, fontSize: 12),
                ),
              ],
            ),
          ),

          // Right Side Button
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(8),
            child: const Icon(Icons.arrow_forward, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
