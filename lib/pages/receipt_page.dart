import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app/data/app_data.dart';

class ReceiptPage extends StatelessWidget {
  const ReceiptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff030617),

      appBar: AppBar(
        backgroundColor: const Color(0xff030617),
        title: const Text("Receipts", style: TextStyle(color: Colors.white)),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Total: ¥${NumberFormat('#,###').format(total)}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: recepits.length,
              itemBuilder: (context, index) {
                final r = recepits[index];

                return Card(
                  color: const Color(0xFF1E293B),

                  child: ListTile(
                    leading: const Icon(
                      Icons.receipt_long,
                      color: Colors.orange,
                    ),

                    title: Text(
                      r.shop,
                      style: const TextStyle(color: Colors.white),
                    ),

                    subtitle: Text(
                      "Receipt #${r.receiptNo} • ${r.date}",
                      style: const TextStyle(color: Colors.grey),
                    ),

                    trailing: Text(
                      "¥${NumberFormat('#,###').format(r.amount)}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
