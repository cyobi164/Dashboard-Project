import "package:flutter/material.dart";

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "LOGO",
              style: TextStyle(
                fontSize: 32,
                color: Colors.white, 
                fontWeight: FontWeight.bold,
                ),
            ),

            const Text(
              "Dashboard (expamle)",
              style: TextStyle(
                fontSize: 32,
                color: Colors.white, 
                fontWeight: FontWeight.bold,
                ),
            ),

            const Text(
              "Version 0.01",
              style: TextStyle(
                fontSize: 32,
                color: Colors.white, 
                fontWeight: FontWeight.bold,
                ),
            ),
          ],
        ),
      ),
    );
  }
}
