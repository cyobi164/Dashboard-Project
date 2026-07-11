import "package:flutter/material.dart";
import "package:app/features/auth/login_pages.dart";
import "package:app/features/auth/register_pages.dart";

class CardFlip extends StatefulWidget {
  const CardFlip({super.key});

  @override
  State<CardFlip> createState() => _CardFlipState();
}

class _CardFlipState extends State<CardFlip> {
  bool showLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: const Color(0xFF0F172A),
    body: Center(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: showLogin
            ? LoginPages(
              key: const ValueKey("Login"),
              onLogin:() {},
            )
            : RegisterPages(
              key: const ValueKey("Register"),
            ),
      ),
    ),
    );
  }
}
