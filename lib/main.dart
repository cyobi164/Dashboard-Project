import 'package:flutter/material.dart';

import 'package:app/features/auth/splash_page.dart';
import 'package:app/features/auth/login_pages.dart';
import 'package:app/features/dashboard/dashboard_shell.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  bool showSplash = true;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        showSplash = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: showSplash
          ? const SplashPage()
          : isLoggedIn
          ? const DashboardShell()
          : LoginPages(
              onLogin: () {
                setState(() {
                  isLoggedIn = true;
                });
              },
            ),
    );
  }
}
