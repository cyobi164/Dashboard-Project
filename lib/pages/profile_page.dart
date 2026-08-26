import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatelessWidget {
  final VoidCallback onLogout;

  const ProfilePage({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020617),

      appBar: AppBar(
        backgroundColor: const Color(0xFF020617),
        title: const Text("Profile", style: TextStyle(color: Colors.white)),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),

        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: Color(0xFF1E293B),
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),

          const Center(
            child: Text(
              "User",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const Center(
            child: Text(
              "User@example.com",
              style: TextStyle(color: Colors.white),
            ),
          ),

          const SizedBox(height: 30),

          Card(
            color: const Color(0xFF1E293B),
            child: Column(
              children: const [
                ListTile(
                  leading: Icon(Icons.settings, color: Colors.white),
                  title: Text("Setting", style: TextStyle(color: Colors.white)),
                ),

                Divider(height: 1),

                ListTile(
                  leading: Icon(Icons.notifications, color: Colors.white),
                  title: Text(
                    "Notifications",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                Divider(height: 1),

                ListTile(
                  leading: Icon(Icons.lock, color: Colors.white),
                  title: Text("Privacy", style: TextStyle(color: Colors.white)),
                ),

                Divider(height: 1),

                ListTile(
                  leading: Icon(Icons.help, color: Colors.white),
                  title: Text(
                    "Help & Support",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
          Card(
            color: const Color(0XFF1E293B),
            child: ListTile(
              leading: Icon(Icons.logout, color: Colors.white),
              title: Text("Logout", style: TextStyle(color: Colors.white)),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                onLogout();
              },
            ),
          ),
        ],
      ),
    );
  }
}
