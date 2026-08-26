import "dart:math" as math;

import "package:flutter/material.dart";
import "package:app/features/auth/login_pages.dart";
import "package:app/features/auth/register_pages.dart";

class CardFlip extends StatefulWidget {
  final VoidCallback onLogin;

  const CardFlip({
    super.key,
    required this.onLogin,
  });

  @override
  State<CardFlip> createState() => _CardFlipState();
}

class _CardFlipState extends State<CardFlip>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  bool showLogin = true;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _flipCard() async {
    if (_controller.isAnimating) return;

    await _controller.forward();

    setState(() {
      showLogin = !showLogin;
    });

    _controller.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final angle = _controller.value * math.pi;

            // Which side should currently be visible?
            final showingFront = angle <= math.pi / 2;

            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(angle),
              child: showingFront
                  ? _buildFront()
                  : Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..rotateY(math.pi),
                      child: _buildBack(),
                    ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFront() {
    if (showLogin) {
      return LoginPages(
        onLogin: widget.onLogin,
        onRegister: _flipCard,
      );
    }

    return RegisterPages(
      onBackToLogin: _flipCard,
    );
  }

  Widget _buildBack() {
    if (showLogin) {
      return RegisterPages(
        onBackToLogin: _flipCard,
      );
    }

    return LoginPages(
      onLogin: widget.onLogin,
      onRegister: _flipCard,
    );
  }
}