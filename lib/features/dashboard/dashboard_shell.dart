import 'package:flutter/material.dart';

import 'package:app/pages/dash_board.dart';
//import 'package:app/pages/profile_page.dart';
import 'package:app/pages/receipt_page.dart';
import 'package:app/pages/transaction_page.dart';
import 'package:app/pages/wallet_page.dart';
import 'package:app/utils/responsive.dart';

//class DashboardShell extends StatefulWidget {
  //final VoidCallback onLogout;

  //const DashboardShell({super.key, required this.onLogout});

  //@override
  //State<DashboardShell> createState() => _DashboardShellState();
//}

class DashboardShell extends StatefulWidget {
  const DashboardShell({super.key});

  @override
  State<DashboardShell> createState() => _DashboardShellState();
}

class _DashboardShellState extends State<DashboardShell> {
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
              color: isSelected
                  ? const Color(0xFF818CF8)
                  : Colors.white70,
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                color: isSelected
                    ? const Color(0xFF818CF8)
                    : Colors.white70,
                fontWeight:
                    isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF071227),
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Menu",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.dashboard, color: Colors.white),
            title: const Text(
              "Dashboard",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              setState(() => selectedIndex = 0);
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: const Icon(
              Icons.account_balance_wallet,
              color: Colors.white,
            ),
            title: const Text(
              "Wallet",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              setState(() => selectedIndex = 1);
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: const Icon(Icons.swap_horiz, color: Colors.white),
            title: const Text(
              "Transactions",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              setState(() => selectedIndex = 2);
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: const Icon(Icons.receipt, color: Colors.white),
            title: const Text(
              "Receipts",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              setState(() => selectedIndex = 3);
              Navigator.pop(context);
            },
          ),

          //ListTile(
            //leading: const Icon(Icons.person, color: Colors.white),
            //title: const Text(
             // "Profile",
              //style: TextStyle(color: Colors.white),
            //),
            //onTap: () {
             // setState(() => selectedIndex = 4);
              //Navigator.pop(context);
            //},
          //),
        ],
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
        return const ReceiptPage();
      //case 4:
        //return ProfilePage(
          //onLogout: widget.onLogout,
        //);
      default:
        return const DashboardPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        drawer: Responsive.isMobile(context)
            ? buildDrawer(context)
            : null,
        appBar: Responsive.isMobile(context)
            ? AppBar(
                backgroundColor: const Color(0xFF071227),
                iconTheme: const IconThemeData(color: Colors.white),
              )
            : null,
        body: Row(
          children: [
            if (!Responsive.isMobile(context))
              Container(
                width: 250,
                color: const Color(0xFF071227),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),

                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(""),
                    ),

                    const SizedBox(height: 20),

                    menuItem(Icons.dashboard, "Dashboard", 0),
                    menuItem(Icons.account_balance_wallet, "Wallet", 1),
                    menuItem(Icons.swap_horiz, "Transactions", 2),
                    menuItem(Icons.receipt, "Receipts", 3),
                    //menuItem(Icons.person, "Profile", 4),
                  ],
                ),
              ),

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
}