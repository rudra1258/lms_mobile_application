import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../authentication/welcome_screen.dart';

class profile_screen extends StatefulWidget {
  const profile_screen({super.key});

  @override
  State<profile_screen> createState() => _profile_screenState();
}

class _profile_screenState extends State<profile_screen> {
  // Editable fields
  String email = "rudra@example.com";
  String phone = "+91 9876543210";
  String address = "Bhubaneswar, Odisha";

  // Profile picture
  File? _profileImage;

  final ImagePicker _picker = ImagePicker();

  // Function to pick image
  Future<void> _pickImage() async {
    final pickedFile =
    await _picker.pickImage(source: ImageSource.gallery, imageQuality: 70);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  // Function to edit field
  void _editField(String title, String currentValue, Function(String) onSave) {
    TextEditingController controller =
    TextEditingController(text: currentValue);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit $title"),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: title,
            prefixIcon: title == "Email"
                ? const Icon(Icons.email)
                : title == "Phone"
                ? const Icon(Icons.phone)
                : const Icon(Icons.home),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                onSave(controller.text);
              });
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  // Function to show logout confirmation
  void _confirmLogout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirm Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), // cancel
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // close dialog
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const login_screen()),
              );
            },
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: _profileImage != null
                                ? FileImage(_profileImage!)
                                : const AssetImage(
                                "assets/img/47115f390c01d9a90d4c76c8b34f8064.jpg")
                            as ImageProvider,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                              onTap: _pickImage,
                              child: const CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.orangeAccent,
                                child: Icon(Icons.camera_alt,
                                    size: 18, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Rudra Prasad",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "5th Sem • B.sc Computer Science",
                        style: TextStyle(color: Colors.black87, fontSize: 14),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // ---- Editable Information ----
                _InfoTile(
                  icon: Icons.email,
                  label: "Email",
                  value: email,
                  onTap: () =>
                      _editField("Email", email, (val) => email = val),
                ),
                _InfoTile(
                  icon: Icons.phone,
                  label: "Phone",
                  value: phone,
                  onTap: () =>
                      _editField("Phone", phone, (val) => phone = val),
                ),
                _InfoTile(
                  icon: Icons.home,
                  label: "Address",
                  value: address,
                  onTap: () =>
                      _editField("Address", address, (val) => address = val),
                ),

                // ---- Non-editable Info ----
                const _InfoTile(
                  icon: Icons.badge,
                  label: "College ID",
                  value: "20180123453",
                ),
                const _InfoTile(
                  icon: Icons.help,
                  label: "Help Center",
                  value: "Get Support",
                ),
                const _InfoTile(
                  icon: Icons.privacy_tip_outlined,
                  label: "Privacy Policy",
                  value: "Trust Safety",
                ),

                // ✅ Logout with confirmation
                _InfoTile(
                  icon: Icons.logout,
                  label: "Logout",
                  value: "",
                  onTap: _confirmLogout,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- REUSABLE WIDGETS ----------------
class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback? onTap;

  const _InfoTile({
    required this.icon,
    required this.label,
    required this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: ListTile(
        leading: Icon(icon, color: Colors.orangeAccent),
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value),
        trailing:
        const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}

// ---------------- SAMPLE LOGOUT SCREEN ----------------
class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Logout")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // back to profile screen
          },
          child: const Text("You are logged out! Go Back"),
        ),
      ),
    );
  }
}
