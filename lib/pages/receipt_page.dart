import 'package:flutter/material.dart';
import 'package:app/models/receipt.dart';
import 'package:intl/intl.dart';

class ReceiptPage extends StatelessWidget {
  const ReceiptPage({super.key});

  @override
  Widget build(BuildContext context) {
    final recepits = [
      Receipt(
        shop: "7-Eleven",
        amount: 1000,
        date: "Mar 1",
        receiptNo: "10012",
      ),

      Receipt(
        shop: "McDonald's",
        amount: 3000,
        date: "Jun 30",
        receiptNo: "11093",
      ),

      Receipt(
        shop: "Amazon",
        amount: 30000,
        date: "Apr 23",
        receiptNo: "11673",
      ),

      Receipt(
        shop: "GU",
        amount: 3000,
        date: "Jan 12",
        receiptNo: "12884",
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xff030617),

      appBar: AppBar(
        backgroundColor: const Color(0xff030617),
        title: const Text("Receipts", style: TextStyle(color: Colors.white)),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: recepits.length,

        itemBuilder: (context, index) {
          final r = recepits[index];

          return Card(
            color: const Color(0xFF1E293B),

            child: ListTile(
              leading: const Icon(Icons.receipt_long, color: Colors.orange),

              title: Text(r.shop, style: const TextStyle(color: Colors.white)),

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
    );
  }
}
