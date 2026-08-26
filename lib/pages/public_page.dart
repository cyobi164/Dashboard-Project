import "package:flutter/material.dart";

class PublicPage extends StatelessWidget {
  final VoidCallback onOpenDemo;

  const PublicPage ({
    super.key,
    required this.onOpenDemo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(40),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              children: [
                const Text(
                  "パーソナルファイナンスダッシュボード",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "シンプルなパーソナルファイナンスダッシュボードアプリケーション。",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),

                const SizedBox (height: 30),

                const Text(
                  "シンプルなパーソナルファイナンスダッシュボードアプリケーション。"
                  "収入や支出、貯蓄などの情報をシンプルに整理し、"
                  "視覚的なダッシュボードから現在の財務状況を直感的に把握できるUI/UXを目指して制作しました。",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 30),

                ElevatedButton(
                  onPressed: onOpenDemo,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6366F1),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 18,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Open Demo",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
