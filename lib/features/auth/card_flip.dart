import "package:flutter/material.dart";
import "package:app/features/auth/login_pages.dart";
import "package:app/features/auth/register_pages.dart";

class CardFlip extends StatefulWidget {
  final VoidCallback onLogin;
  const CardFlip({super.key, required this.onLogin});

  @override
  State<CardFlip> createState() => _CardFlipState();
}

class _CardFlipState extends State<CardFlip>
    with SingleTickerProviderStateMixin {
  bool showLogin = true;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 3.14159).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: Center(
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(_animation.value),
           /// child: child,
            
          child: showLogin
              ? LoginPages(
                  key: const ValueKey("login"),
                  onLogin: widget.onLogin,
                  onRegister: () {
                    setState(() {
                      showLogin = false;
                    });
                  },
                )
              : RegisterPages(
                  key: const ValueKey("register"),
                  onBackToLogin: () {
                    setState(() {
                      showLogin = true;
                    });
                  },
                ),
                
        ),
      ),
    );
  }
}
