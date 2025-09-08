import 'package:flutter/material.dart';

class library_screen extends StatefulWidget {
  const library_screen({super.key});

  @override
  State<library_screen> createState() => _library_screenState();
}

class _library_screenState extends State<library_screen> {
  final List<String> categories = [
    'Education',
    'Funny',
    'Story',
    'Mystery',
    'Mythological'
  ];

  final List<String> extracategories = [
    'History',
    'Chemistry',
    'Geography',
    'Computer Science'
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 55,
        centerTitle: true,
        title: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: "College ",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                ),
              ),
              TextSpan(
                text: "Library",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),

      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // ✅ Background Image with Opacity
          Opacity(
            opacity: 0.3,
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
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all( 35.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Greeting
                  const Text(
                    "Grab a book!",
                    style: TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),

                  // Search Bar + Filter Button
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              icon: Icon(Icons.search, color: Colors.black54),
                              hintText: "Search title, genre or author...",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      // ✅ Filter Button with BottomSheet
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                            ),
                            builder: (context) {
                              return Container(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Choose Category",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    const SizedBox(height: 15),
                                    ...categories.map((subject) => ListTile(
                                      title: Text(subject),
                                      onTap: () {
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text("Selected: $subject")),
                                        );
                                      },
                                    )),
                                    // const Text(
                                    //   "More Subjects",
                                    //   style: TextStyle(
                                    //       fontSize: 16,
                                    //       fontWeight: FontWeight.w600,
                                    //       color: Colors.black54),
                                    // ),
                                    // ...extracategories.map((subject) => ListTile(
                                    //   title: Text(subject),
                                    //   onTap: () {
                                    //     Navigator.pop(context);
                                    //     ScaffoldMessenger.of(context).showSnackBar(
                                    //       SnackBar(content: Text("Selected: $subject")),
                                    //     );
                                    //   },
                                    // )),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.purple.shade100,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.tune, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Categories
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            spacing: 12,
                            runSpacing: 10,
                            children: [
                              _buildCategory("Biology", Colors.orange.shade300,
                                  width * 0.4, 50),
                              _buildCategory("Physics", Colors.amber.shade200,
                                  width * 0.4, 50),
                              _buildCategory("English", Colors.red.shade200,
                                  width * 0.83, 60),
                              _buildCategory("Math", Colors.purple.shade200,
                                  width * 0.4, 60),
                              _buildCategory("Mechanics",
                                  Colors.green.shade300, width * 0.4, 60),
                            ],
                          ),
                          const SizedBox(height: 20),

                          // Popular Now Section
                          const Text(
                            "Popular Now",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            height: 150,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                _buildBookCard(
                                    "assets/img/bookcover1.jpeg", "Book One"),
                                _buildBookCard(
                                    "assets/img/book2.jpeg", "Book Two"),
                                _buildBookCard(
                                    "assets/img/bookcover3.jpeg", "Book Three"),
                                _buildBookCard(
                                    "assets/img/bookcover1.jpeg", "Book One"),
                                _buildBookCard(
                                    "assets/img/book2.jpeg", "Book Two"),
                                _buildBookCard(
                                    "assets/img/bookcover3.jpeg", "Book Three"),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            height: 150,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                _buildBookCard(
                                    "assets/img/bookcover1.jpeg", "Book One"),
                                _buildBookCard(
                                    "assets/img/book2.jpeg", "Book Two"),
                                _buildBookCard(
                                    "assets/img/bookcover3.jpeg", "Book Three"),
                              ],
                            ),
                          )
                        ],
                      ),
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

  // Category Widget
  Widget _buildCategory(
      String title, Color color, double width, double height) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color.withOpacity(0.9),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Text(
        title,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
      ),
    );
  }

  // Book Card Widget
  Widget _buildBookCard(String img, String title) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.black12, blurRadius: 5, offset: Offset(0, 3))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
              const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                img,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
