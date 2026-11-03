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

const Color appBackgroundColor = Color(0xFFF4F5FA);
const Color sidebarWhite = Color(0xFFFFFFFF);
const Color primaryPurple = Color(0xFF6975F8);
const Color secondaryPurple = Color(0xFFEEF0FF);
const Color primaryText = Color(0xFF202844);
const Color secondaryText = Color(0xFF8992AB);

class DashboardShell extends StatefulWidget {
  const DashboardShell({super.key});

  @override
  State<DashboardShell> createState() => _DashboardShellState();
}

class _DashboardShellState extends State<DashboardShell> {
  int selectedIndex = 0;

  Widget menuItem(IconData icon, String title, int index) {
    final bool isSelected = selectedIndex == index;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? secondaryPurple : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(icon, color: isSelected ? primaryPurple : secondaryText),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: isSelected ? primaryPurple : primaryText,
                    fontSize: 13,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSidebar() {
    return Container(
      width: 220,
      color: sidebarWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 24, 16, 32),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: primaryPurple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 9),
                const Text(
                  "My App",
                  style: TextStyle(
                    color: primaryText,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.fromLTRB(24, 0, 16, 10),
            child: Text(
              "Workspace",
              style: TextStyle(
                color: secondaryText,
                fontSize: 12,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.2,
              ),
            ),
          ),

          menuItem(Icons.grid_view, "Dashboard", 0),
          menuItem(Icons.swap_horiz_rounded, "Transactions", 2),
          menuItem(Icons.account_balance_wallet, "Wallet", 1),
          menuItem(Icons.receipt_long, "Receipts", 3),

          const Spacer(),

          Container(
            margin: const EdgeInsets.all(14),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFF4F5FF),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.auto_awesome, color: primaryPurple, size: 22),
                SizedBox(width: 10),
                Text(
                  "My Workspace",
                  style: TextStyle(
                    color: primaryPurple,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  "Personal accout",
                  style: TextStyle(color: secondaryText, fontSize: 10),
                ),
              ],
            ),
          ),
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
      default:
        return const DashboardPage();
    }
  }

  Widget buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: sidebarWhite,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: primaryPurple,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "D",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "dashboard",
                    style: TextStyle(
                      color: primaryText,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            menuItem(Icons.grid_view_rounded, "Overview", 0),
            menuItem(Icons.swap_horiz_rounded, "Transactions", 2),
            menuItem(Icons.account_balance_wallet_outlined, "wallet", 1),
            menuItem(Icons.receipt_long_outlined, "Receipts", 3),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return Scaffold(
      backgroundColor: appBackgroundColor,
      drawer: isMobile ? buildDrawer(context) : null,
      appBar: isMobile
          ? AppBar(
              backgroundColor: sidebarWhite,
              elevation: 0,
              iconTheme: const IconThemeData(color: primaryText),
            )
          : null,
      body: Row(
        children: [
          if (!isMobile) ...[
            buildSidebar(),
            const VerticalDivider(
              width: 1,
              thickness: 1,
              color: Color(0xFFEAECF2),
            ),
          ],
          Expanded(
            child: Container(color: appBackgroundColor, child: getPage()),
          ),
        ],
      ),
    );
  }
}
