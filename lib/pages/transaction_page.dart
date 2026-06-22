import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app/models/transaction.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      Transaction(title: "Food", amount: -3500, isIncome: false),
      Transaction(title: "Netflix", amount: -1200, isIncome: false),
      Transaction(title: "Salary", amount: 200000, isIncome: true),
      Transaction(title: "Coffee", amount: -450, isIncome: false),
      Transaction(title: "Conbini", amount: 500, isIncome: false),
      Transaction(title: "Friend A", amount: 5000, isIncome: true),
    ];

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
            ),
          );
        },
      ),
    );
  }
}
