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

    _animation = Tween<double>(
      begin: 0,
      end: 3.14159,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _flipCard() async {
    if (_controller.isAnimating) return;

    //90 degrees rotation
    await _controller.animateTo(
      0.5,
      duration: const Duration(milliseconds: 250),
    );

    //change page here
    setState(() {
      showLogin = !showLogin;
    });

    //180 degrees rotation
    await _controller.forward();
    
    _controller.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            final angle = _animation.value;

            final isFront = angle <= 1.5708; // pi/2

            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(_animation.value),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  //front
                  if (showLogin && isFront)
                    LoginPages(onLogin: widget.onLogin, onRegister: _flipCard),

                  // Register is back
                  if (showLogin && !isFront)
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()..rotateY(3.14159),
                      child: RegisterPages(onBackToLogin: _flipCard),
                    ),

                  //register
                  if (!showLogin && isFront)
                    RegisterPages(onBackToLogin: _flipCard),

                  // Login is back
                  if (!showLogin && !isFront)
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()..rotateY(3.14159),
                      child: LoginPages(
                        onLogin: widget.onLogin,
                        onRegister: _flipCard,
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
