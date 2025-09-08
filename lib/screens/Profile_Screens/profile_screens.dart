import 'package:flutter/material.dart';

class profile_screen extends StatefulWidget {
  const profile_screen({super.key});

  @override
  State<profile_screen> createState() => _profile_screenState();
}

class _profile_screenState extends State<profile_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   automaticallyImplyLeading: false,
      //   elevation: 0,
      // ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // ✅ Background image with opacity
          Opacity(
            opacity: 0.4,
            child: Image.asset(
              'assets/img/Picsart_25-08-21_15-14-30-585.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),

          // ✅ Foreground content
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 80, left: 16, right: 16),
            child: Column(
              children: [
                // ---- Profile Header ----
                Center(
                  child: Column(
                    children: const [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage(
                            "assets/img/47115f390c01d9a90d4c76c8b34f8064.jpg"),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Rudra Prasad",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "7th Sem • Computer Science & Engg",
                        style: TextStyle(color: Colors.black87, fontSize: 14),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // ---- Personal Information ----
                
                _InfoTile(
                    icon: Icons.email,
                    label: "Email",
                    value: "rudra@example.com"),
                _InfoTile(
                    icon: Icons.phone,
                    label: "Phone",
                    value: "+91 9876543210"),
                _InfoTile(
                    icon: Icons.badge,
                    label: "College ID",
                    value: "20180123453"),
                _InfoTile(
                    icon: Icons.home,
                    label: "Address",
                    value: "Bhubaneswar, Odisha"),

                _InfoTile(
                    icon: Icons.person,
                    label: "Personal Information",
                    value: "View / Edit"),
                _InfoTile(
                    icon: Icons.help,
                    label: "Help Center",
                    value: "Get Support"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- REUSABLE WIDGETS ----------------
class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.blueAccent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value),
        trailing:
        const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: () {
          // TODO: Add navigation to edit or help center pages
        },
      ),
    );
  }
}
