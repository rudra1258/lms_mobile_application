import 'package:flutter/material.dart';

class alert_screen extends StatefulWidget {
  const alert_screen({super.key});

  @override
  State<alert_screen> createState() => _alert_screenState();
}

class _alert_screenState extends State<alert_screen> {
  // Sample notifications
  List<String> notifications = [
    "New message from Admin",
    "Your order has been shipped",
    "Update available",
    "Password changed successfully",
    "Welcome to our app!"
  ];

  // Refresh logic
  Future<void> _refreshNotifications() async {
    await Future.delayed(const Duration(seconds: 1)); // simulate delay
    setState(() {
      notifications.add("New notification at ${DateTime.now().hour}:${DateTime.now().minute}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 60,
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            "Notifications",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background image with opacity
          Opacity(
            opacity: 0.4,
            child: Image.asset(
              'assets/img/Picsart_25-08-21_15-14-30-585.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),

          // Notifications list with pull-to-refresh + swipe-to-delete
          RefreshIndicator(
            onRefresh: _refreshNotifications,
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Dismissible(
                      key: Key(notifications[index]),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      onDismissed: (direction) {
                        setState(() {
                          notifications.removeAt(index);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Notification deleted")),
                        );
                      },
                      child: Card(
                        child: ListTile(
                          leading:  Icon(Icons.notifications, color: Colors.orange[700],),
                          title: Text(notifications[index]),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),// space between cards
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
