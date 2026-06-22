import 'package:flutter/material.dart';
import 'package:app/models/transaction.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:app/utils/responsive.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final titles = ["Balance", "Used", "Savings"];

    final amounts = ["¥1,000,000", "¥50,000", "¥400,000"];

    final icons = [Icons.account_balance_wallet, Icons.payment, Icons.savings];

    final gradients = [
      [const Color(0xFF4F46E5), const Color(0xFF3BB2F6)],
      [const Color(0xFF10B981), const Color(0xFF34D399)],
      [const Color(0xFFF59E0B), const Color(0xFFFBBF24)],
    ];

    final transactions = [
      Transaction(title: "Food", amount: -3500, isIncome: false),
      Transaction(title: "Netflix", amount: -1200, isIncome: false),
      Transaction(title: "Salary", amount: 200000, isIncome: true),
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
        padding: const EdgeInsets.all(24),
        child: Column(
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
              "Welcome back, 👋",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),

            const SizedBox(height: 24),

            GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Responsive.isMobile(context)
                    ? 1
                    : Responsive.isTablet(context)
                        ? 2
                        : 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 2.2
              ),

              itemCount: titles.length,

              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),

                    gradient: LinearGradient(
                      colors: gradients[index],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.15),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Text(
                            titles[index],
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 18,
                            ),
                          ),

                          Icon(icons[index], color: Colors.white70),
                        ],
                      ),

                      Text(
                        amounts[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 24),

            const SpendingChart(),

            const SizedBox(height: 24),

            Container(
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
                        t.isIncome ? Icons.attach_money : Icons.money_off,
                        color: t.isIncome ? Colors.green : Colors.red,
                      ),
                      title: Text(
                        t.title,
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: Text(
                        "${t.isIncome ? "+" : "-"}¥${t.amount.abs().toInt()}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SpendingChart extends StatelessWidget {
  const SpendingChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
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
          Text(
            "Spending Over Time",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 12),

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

          Expanded(
            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: 11,
                minY: 0,
                maxY: 16000,

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
                  // Income
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

                  // Expense
                  LineChartBarData(
                    isCurved: true,
                    color: Colors.pinkAccent,
                    barWidth: 4,
                    dotData: const FlDotData(show: true),

                    spots: [
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
          ),
        ],
      ),
    );
  }
}
