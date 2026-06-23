import 'package:app/pages/dash_board.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/transaction_page.dart';
import 'package:app/pages/wallet_page.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  String name = "";
  final TextEditingController controller = TextEditingController();
  int selectedIndex = 0;

  Widget menuItem(IconData icon, String title, int index) {
    bool isSelected = selectedIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        color: isSelected ? const Color(0xFF1E293B) : Colors.transparent,

        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? const Color(0xFF818CF8) : Colors.white70,
            ),
            const SizedBox(width: 10),

            Text(
              title,
              style: TextStyle(
                color: isSelected ? const Color(0xFF818CF8) : Colors.white70,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Row(
          children: [
            //sidebar
            Container(
              width: 250,
              color: const Color(0xFF071227),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),

                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  //Menu Items
                  menuItem(Icons.dashboard, "Dashboard", 0),
                  menuItem(Icons.account_balance_wallet, "Wallet", 1),
                  menuItem(Icons.swap_horiz, "Transactions", 2),
                  menuItem(Icons.receipt, "Receipts", 3),
                  menuItem(Icons.person, "Profile", 4),
                ],
              ),
            ),

            //main content
            Expanded(
              child: Container(
                color: const Color(0xFF0F172A),
                child: getPage(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getPage() {
    switch (selectedIndex) {
      case 0:
        return const DashboardPage();
      case 1:
        return const Wallet();
      case 2:
        return const TransactionPage();
      case 3:
        return const Center(child: Text("Receipts Page"));
      case 4:
        return const Center(child: Text("Profile Page"));
      default:
        return const DashboardPage();
    }
  }
}
