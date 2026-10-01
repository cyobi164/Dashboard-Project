import 'package:flutter/material.dart';
import 'package:app/models/transaction.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:app/utils/responsive.dart';
import 'package:intl/intl.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      Transaction(title: "Food", amount: -3500, isIncome: false, date: "Jan 5"),
      Transaction(
        title: "Netflix",
        amount: -1200,
        isIncome: false,
        date: "Feb 20",
      ),
      Transaction(
        title: "Salary",
        amount: 200000,
        isIncome: true,
        date: "Mar 25",
      ),
    ];

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF020617), Color(0xFF08122D), Color(0xFF020617)],
        ),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(Responsive.isMobile(context) ? 12 : 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // =========================
            // HEADER
            // =========================
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Dashboard",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Good evening 👋",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Overview.",
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.5),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),

                // Month Selector
                GestureDetector(
                  onTap: () {
                    // calander popup
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E293B),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.08),
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.white70,
                          size: 18,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "September",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 6),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white70,
                          size: 20,
                        ),
                      ]
                    )

                  )
                )
                
              ],
            ),

            const SizedBox(height: 28),

            // =========================
            // SUMMARY CARDS
            // =========================
            Responsive.isMobile(context)
                ? Column(
                    children: [
                      _SummaryCard(
                        title: "Total Balance",
                        amount: "¥1,000,000",
                        subtitle: "↑ 8.2% this month",
                        icon: Icons.account_balance_wallet_outlined,
                        subtitleColor: Colors.greenAccent,
                        gradientColors: const [
                          Color(0xFF4F46E5),
                          Color(0xFF3BB2F6),
                        ],
                      ),
                      const SizedBox(height: 12),
                      _SummaryCard(
                        title: "Income",
                        amount: "¥200,000",
                        subtitle: "This month",
                        icon: Icons.attach_money_outlined,
                        subtitleColor: Colors.greenAccent,
                        gradientColors: const [
                          Color(0xFF10B981),
                          Color(0xFF34D399),
                        ],
                      ),
                      const SizedBox(height: 12),
                      _SummaryCard(
                        title: "Expense",
                        amount: "¥90,000",
                        subtitle: "↓ 5.5% this month",
                        icon: Icons.money_off_outlined,
                        subtitleColor: Colors.redAccent,
                        gradientColors: const [
                          Color(0xFFF59E0B),
                          Color(0xFFFBBF24),
                        ],
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Expanded(
                        child: _SummaryCard(
                          title: "Total Balance",
                          amount: "¥1,000,000",
                          subtitle: "↑ 8.2% this month",
                          icon: Icons.account_balance_wallet_outlined,
                          subtitleColor: Colors.greenAccent,
                          gradientColors: const [
                            Color(0xFF4F46E5),
                            Color(0xFF3BB2F6),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _SummaryCard(
                          title: "Income",
                          amount: "¥200,000",
                          subtitle: "This month",
                          icon: Icons.attach_money_outlined,
                          subtitleColor: Colors.greenAccent,
                          gradientColors: const [
                            Color(0xFF10B981),
                            Color(0xFF34D399),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _SummaryCard(
                          title: "Expense",
                          amount: "¥90,000",
                          subtitle: "↓ 5.5% this month",
                          icon: Icons.money_off_outlined,
                          subtitleColor: Colors.redAccent,
                          gradientColors: const [
                            Color(0xFFF59E0B),
                            Color(0xFFFBBF24),
                          ],
                        ),
                      ),
                    ],
                  ),

            const SizedBox(height: 24),

            Responsive.isMobile(context)
                ? Column(
                    children: [
                      const SavingsChart(),
                      const SizedBox(height: 24),
                      const SpendingChart(),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          height: 450,
                          child: const SpendingChart(),
                        ),
                      ),

                      const SizedBox(width: 16),

                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 450,
                          child: const SavingsChart(),
                        ),
                      ),

                      const SizedBox(width: 16),

                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 450,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1E293B),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                const Text(
                                  "Recent Transactions",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 16),

                                ...transactions.map((t) {
                                  return ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    leading: Icon(
                                      t.isIncome
                                          ? Icons.attach_money
                                          : Icons.money_off,
                                      color: t.isIncome
                                          ? Colors.green
                                          : Colors.red,
                                    ),
                                    title: Text(
                                      t.title,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    trailing: Text(
                                      "${t.isIncome ? "+" : "-"}¥${NumberFormat('#,###').format(t.amount.abs())}",
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}

// ======================================================
// SUMMARY CARD
// ======================================================

class _SummaryCard extends StatelessWidget {
  final String title;
  final String amount;
  final String subtitle;
  final IconData icon;
  final Color subtitleColor;
  final List<Color> gradientColors;

  const _SummaryCard({
    required this.title,
    required this.amount,
    required this.subtitle,
    required this.icon,
    required this.subtitleColor,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColors,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title + Icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(icon, color: Colors.white.withValues(alpha: 0.75), size: 20),
            ],
          ),

          const SizedBox(height: 24),

          // Amount
          Text(
            amount,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          // Subtitle
          Text(
            subtitle,
            style: TextStyle(
              color: subtitleColor,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

// ======================================================
// SAVINGS CHART
// ======================================================

class SavingsChart extends StatelessWidget {
  const SavingsChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Savings",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.more_vert, color: Colors.white.withValues(alpha: 0.6)),
            ],
          ),

          const SizedBox(height: 20),

          SizedBox(
            height: 180,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PieChart(
                  PieChartData(
                    sectionsSpace: 0,
                    centerSpaceRadius: 55,
                    startDegreeOffset: -90,
                    sections: [
                      PieChartSectionData(
                        value: 10,
                        color: Colors.cyanAccent,
                        radius: 20,
                        showTitle: false,
                      ),
                      PieChartSectionData(
                        value: 90,
                        color: Colors.white.withValues(alpha: 0.10),
                        radius: 20,
                        showTitle: false,
                      ),
                    ],
                  ),
                ),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "10%",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "¥100,000",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Savings Goal",
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.5),
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 4),

              const Text(
                "¥1,000,000",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Container(
            height: 8,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(10),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: 0.1, // 10% progress
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.cyanAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, size: 18),
              label: const Text("Add Savings"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyanAccent,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ======================================================
// SPENDING CHART
// ======================================================

class SpendingChart extends StatelessWidget {
  const SpendingChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Responsive.isMobile(context) ? 300 : 450,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFF111827),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00E5FF).withValues(alpha: 0.35),
            blurRadius: 25,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Spending Over Time",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          // Chart Legend
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.cyanAccent,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              const Text("Income", style: TextStyle(color: Colors.white70)),
              const SizedBox(width: 24),
              Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.pinkAccent,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              const Text("Expense", style: TextStyle(color: Colors.white70)),
            ],
          ),

          const SizedBox(height: 8),

          Expanded(
            child: Stack(
              children: [
                // Background bars
                BarChart(
                  BarChartData(
                    minY: 0,
                    maxY: 3500,
                    borderData: FlBorderData(show: false),
                    gridData: FlGridData(show: false),

                    titlesData: const FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),

                    barGroups: [
                      BarChartGroupData(
                        x: 0,
                        barRods: [
                          BarChartRodData(
                            toY: 1200,
                            color: Colors.cyanAccent.withValues(alpha: 0.05),
                            width: 18,
                            borderRadius: BorderRadius.zero,
                          ),
                        ],
                      ),
                      BarChartGroupData(
                        x: 1,
                        barRods: [
                          BarChartRodData(
                            toY: 1700,
                            color: Colors.cyanAccent.withValues(alpha: 0.05),
                            width: 18,
                            borderRadius: BorderRadius.zero,
                          ),
                        ],
                      ),
                      BarChartGroupData(
                        x: 2,
                        barRods: [
                          BarChartRodData(
                            toY: 1400,
                            color: Colors.cyanAccent.withValues(alpha: 0.05),
                            width: 18,
                            borderRadius: BorderRadius.zero,
                          ),
                        ],
                      ),
                      BarChartGroupData(
                        x: 3,
                        barRods: [
                          BarChartRodData(
                            toY: 2100,
                            color: Colors.cyanAccent.withValues(alpha: 0.05),
                            width: 18,
                            borderRadius: BorderRadius.zero,
                          ),
                        ],
                      ),
                      BarChartGroupData(
                        x: 4,
                        barRods: [
                          BarChartRodData(
                            toY: 1800,
                            color: Colors.cyanAccent.withValues(alpha: 0.05),
                            width: 18,
                            borderRadius: BorderRadius.zero,
                          ),
                        ],
                      ),
                      BarChartGroupData(
                        x: 5,
                        barRods: [
                          BarChartRodData(
                            toY: 2500,
                            color: Colors.cyanAccent.withValues(alpha: 0.05),
                            width: 18,
                            borderRadius: BorderRadius.zero,
                          ),
                        ],
                      ),
                      BarChartGroupData(
                        x: 6,
                        barRods: [
                          BarChartRodData(
                            toY: 2300,
                            color: Colors.cyanAccent.withValues(alpha: 0.05),
                            width: 18,
                            borderRadius: BorderRadius.zero,
                          ),
                        ],
                      ),
                      BarChartGroupData(
                        x: 7,
                        barRods: [
                          BarChartRodData(
                            toY: 1700,
                            color: Colors.cyanAccent.withValues(alpha: 0.05),
                            width: 18,
                            borderRadius: BorderRadius.zero,
                          ),
                        ],
                      ),
                      BarChartGroupData(
                        x: 8,
                        barRods: [
                          BarChartRodData(
                            toY: 1800,
                            color: Colors.cyanAccent.withValues(alpha: 0.05),
                            width: 18,
                            borderRadius: BorderRadius.zero,
                          ),
                        ],
                      ),
                      BarChartGroupData(
                        x: 9,
                        barRods: [
                          BarChartRodData(
                            toY: 1750,
                            color: Colors.cyanAccent.withValues(alpha: 0.05),
                            width: 18,
                            borderRadius: BorderRadius.zero,
                          ),
                        ],
                      ),
                      BarChartGroupData(
                        x: 10,
                        barRods: [
                          BarChartRodData(
                            toY: 2000,
                            color: Colors.cyanAccent.withValues(alpha: 0.05),
                            width: 18,
                            borderRadius: BorderRadius.zero,
                          ),
                        ],
                      ),
                      BarChartGroupData(
                        x: 11,
                        barRods: [
                          BarChartRodData(
                            toY: 2450,
                            color: Colors.cyanAccent.withValues(alpha: 0.05),
                            width: 18,
                            borderRadius: BorderRadius.zero,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Your existing line chart
                LineChart(
                  LineChartData(
                    minX: 0,
                    maxX: 11,
                    minY: 0,
                    maxY: 3500,

                    lineTouchData: LineTouchData(
                      handleBuiltInTouches: true,
                      touchTooltipData: LineTouchTooltipData(
                        getTooltipItems: (spots) {
                          return spots.map((spot) {
                            return LineTooltipItem(
                              spot.barIndex == 0
                                  ? "Income\n¥${spot.y.toInt()}"
                                  : "Expense\n¥${spot.y.toInt()}",
                              TextStyle(
                                color: spot.barIndex == 0
                                    ? Colors.cyanAccent
                                    : Colors.pinkAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          }).toList();
                        },
                      ),
                    ),

                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      horizontalInterval: 500,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: Colors.white.withValues(alpha: 0.08),
                          strokeWidth: 1,
                        );
                      },
                    ),

                    borderData: FlBorderData(show: false),

                    titlesData: FlTitlesData(
                      leftTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 1,
                          getTitlesWidget: (value, meta) {
                            const months = [
                              "jan",
                              "feb",
                              "mar",
                              "apr",
                              "may",
                              "jun",
                              "jul",
                              "aug",
                              "sep",
                              "oct",
                              "nov",
                              "dec",
                            ];

                            if (value.toInt() < 0 ||
                                value.toInt() >= months.length) {
                              return const SizedBox();
                            }

                            return Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                months[value.toInt()],
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    lineBarsData: [
                      LineChartBarData(
                        isCurved: true,
                        color: Colors.cyanAccent,
                        barWidth: 4,
                        dotData: const FlDotData(show: true),
                        spots: const [
                          FlSpot(0, 1200),
                          FlSpot(1, 1700),
                          FlSpot(2, 1400),
                          FlSpot(3, 2100),
                          FlSpot(4, 1800),
                          FlSpot(5, 2500),
                          FlSpot(6, 2300),
                          FlSpot(7, 1700),
                          FlSpot(8, 1800),
                          FlSpot(9, 1750),
                          FlSpot(10, 2000),
                          FlSpot(11, 2450),
                        ],
                        belowBarData: BarAreaData(
                          show: true,
                          color: Colors.cyanAccent.withValues(alpha: 0.15),
                        ),
                      ),

                      LineChartBarData(
                        isCurved: true,
                        color: Colors.pinkAccent,
                        barWidth: 4,
                        dotData: const FlDotData(show: true),
                        spots: const [
                          FlSpot(0, 900),
                          FlSpot(1, 1100),
                          FlSpot(2, 1000),
                          FlSpot(3, 1400),
                          FlSpot(4, 1300),
                          FlSpot(5, 1600),
                          FlSpot(6, 1500),
                          FlSpot(7, 2000),
                          FlSpot(8, 1500),
                          FlSpot(9, 2500),
                          FlSpot(10, 300),
                          FlSpot(11, 2890),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
