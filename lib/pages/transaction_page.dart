import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app/data/app_data.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: const Color(0xFF020617),

      appBar: AppBar(
        backgroundColor: const Color(0xFF020617),
        title: const Text(
          "Transactions",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: transactions.length,

        itemBuilder: (context, index) {
          final t = transactions[index];

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            color: const Color(0xFF1E293B),

            child: ListTile(
              leading: Icon(
                t.isIncome ? Icons.attach_money : Icons.money_off,
                color: t.isIncome ? Colors.green : Colors.red,
              ),

              title: Text(t.title, style: const TextStyle(color: Colors.white)),

              trailing: Text(
                "${t.isIncome ? "+" : "-"}¥${NumberFormat('#,###').format(t.amount.abs())}",
                style: TextStyle(
                  color: t.isIncome ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),

              subtitle: Text(
                t.date,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          );
        },
      ),
    );
  }
}
