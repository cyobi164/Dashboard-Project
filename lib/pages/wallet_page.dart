import 'package:flutter/material.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020617),

      appBar: AppBar(
        backgroundColor: const Color(0xFF020617),
        title: const Text("Wallet", style: TextStyle(color: Colors.white)),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            walletCard(
              "Main Account",
              "¥1,000,000",
              Icons.account_balance_wallet,
              Colors.blue,
            ),

            const SizedBox(height: 16),

            walletCard("Savings", "¥500,000", Icons.trending_up, Colors.orange),
          ],
        ),
      ),
    );
  }

  Widget walletCard(
    String title,
    String amonut,
    IconData icon,
    Color iconColor,
  ) {
    return Card(
      color: const Color(0xff1E293B),

      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        trailing: Text(
          amonut,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
