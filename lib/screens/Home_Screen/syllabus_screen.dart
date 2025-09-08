import 'package:flutter/material.dart';

class syllabus_screen extends StatefulWidget {
  const syllabus_screen({super.key});

  @override
  State<syllabus_screen> createState() => _syllabus_screenState();
}

class _syllabus_screenState extends State<syllabus_screen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text.rich(
          TextSpan(
            text: "Your ",
            style: TextStyle(color: Colors.black, fontSize: 20),
            children: [
              TextSpan(
                text: "Syllabus",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center, // ✅ Ensures center alignment
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 🔹 Background Image
          Positioned.fill(
            child: Opacity(
              opacity: 0.2, // dim effect
              child: Image.asset(
                "assets/img/Picsart_25-08-21_15-14-30-585.jpg", // put your image path here
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 🔹 Foreground UI
          SafeArea(
            child: Column(
              children: [
                // Header
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal:10, vertical: 10),
                  // decoration: const BoxDecoration(
                  //   color: Color(0xFF90CAF9),
                  //   // yellow background
                  //   borderRadius: BorderRadius.only(
                  //     bottomLeft: Radius.circular(20),
                  //     bottomRight: Radius.circular(20),
                  //   ),
                  // ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Back + Title + Actions
                      Row(
                        children: [
                          // GestureDetector(
                          //   onTap: () {
                          //     Navigator.pop(context);
                          //   },
                          //   child: const Icon(Icons.arrow_back, color: Colors.black),
                          // ),
                          // const SizedBox(width: 8),
                          // const Spacer(),
                          // const Text(
                          //   "Your Syllabus",
                          //   style: TextStyle(
                          //       color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
                          // ),
                          const Spacer(),
                          // IconButton(
                          //   icon: const Icon(Icons.search, color: Colors.black),
                          //   onPressed: () {},
                          // ),
                          // IconButton(
                          //   icon: const Icon(Icons.menu, color: Colors.black),
                          //   onPressed: () {},
                          // ),
                        ],
                      ),

                      // Tabs
                      TabBar(
                        controller: _tabController,
                        indicatorColor: Colors.black,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.black54,
                        tabs: const [
                          Tab(text: "Topics"),
                          Tab(text: "Syllabus"),
                        ],
                      ),
                    ],
                  ),
                ),

                // Tab Views
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildTopicsTab(),
                      const Center(child: Text("Syllabus Content")),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopicsTab() {
    final topics = [
      {
        "date": "03",
        "month": "SEP",
        "day": "SUN",
        "title": "Isometric drawing and home work including 5 drawing",

      },
      {
        "date": "02",
        "month": "SEP",
        "day": "SAT",
        "title": "Poster Making and Creative story Writing",

      },
      {
        "date": "01",
        "month": "SEP",
        "day": "FRI",
        "title": "Problem identification and Problem solving",

      },
      {
        "date": "29",
        "month": "AUG",
        "day": "TUE",
        "title": "Animation design and character Design",

      },
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ...topics.asMap().entries.map((entry) {
          final t = entry.value;
          return _buildTopicCard(
            t["date"].toString(),
            t["month"].toString(),
            t["day"].toString(),
            t["title"].toString(),

          );
        }),
        const SizedBox(height: 12),
        // const Center(
        //   child: Text(
        //     "August 2019",
        //     style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        //   ),
        // ),
      ],
    );
  }

  Widget _buildTopicCard(
      String date, String month, String day, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9), // semi-transparent over bg
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5)
        ],
      ),
      child: Row(
        children: [
          // Date box
          Container(
            width: 70,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.purple.shade700,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(date,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)),
                Text(month,
                    style: const TextStyle(color: Colors.white, fontSize: 14)),
                Text(day,
                    style: const TextStyle(color: Colors.white, fontSize: 12)),
              ],
            ),
          ),

          // Title + Icon
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
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
