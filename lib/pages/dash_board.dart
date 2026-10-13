import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:app/models/transaction.dart';
import 'package:app/utils/responsive.dart';

// ======================================================
// DASHBOARD PAGE
// ======================================================

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool _showCalendar = false;

  DateTime _selectedMonth = DateTime(2026, 9);

  final List<Transaction> _transactions = [
    Transaction(title: 'Food', amount: -3500, isIncome: false, date: 'Jan 5'),
    Transaction(
      title: 'Netflix',
      amount: -1200,
      isIncome: false,
      date: 'Feb 20',
    ),
    Transaction(
      title: 'Salary',
      amount: 200000,
      isIncome: true,
      date: 'Mar 25',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF020617), Color(0xFF08122D), Color(0xFF020617)],
        ),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(isMobile ? 12 : 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ==========================================
            // HEADER
            // ==========================================
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dashboard',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isMobile ? 26 : 32,
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
                        'Overview.',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.5),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 8),

                // Month selector and custom calendar
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _showCalendar = !_showCalendar;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E293B),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.08),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.white70,
                              size: 18,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              DateFormat('MMM').format(_selectedMonth),
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Icon(
                              _showCalendar
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: Colors.white70,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),

                    if (_showCalendar) ...[
                      const SizedBox(height: 8),
                      _buildCalendar(),
                    ],
                  ],
                ),
              ],
            ),

            const SizedBox(height: 28),

            // ==========================================
            // SUMMARY CARDS
            // ==========================================
            if (isMobile)
              Column(
                children: [
                  _SummaryCard(
                    title: 'Total Balance',
                    amount: '¥1,000,000',
                    subtitle: '↑8.2% this month',
                    icon: Icons.account_balance_wallet_outlined,
                    subtitleColor: Colors.greenAccent,
                    gradientColors: const [
                      Color(0xFF4F46E5),
                      Color(0xFF3BB2F6),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _SummaryCard(
                    title: 'Income',
                    amount: '¥200,000',
                    subtitle: 'This month',
                    icon: Icons.attach_money_outlined,
                    subtitleColor: Colors.greenAccent,
                    gradientColors: const [
                      Color(0xFF10B981),
                      Color(0xFF34D399),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _SummaryCard(
                    title: 'Expense',
                    amount: '¥90,000',
                    subtitle: '↓ 5.5% this month',
                    icon: Icons.money_off_outlined,
                    subtitleColor: Colors.redAccent,
                    gradientColors: const [
                      Color(0xFFF59E0B),
                      Color(0xFFFBBF24),
                    ],
                  ),
                ],
              )
            else
              Row(
                children: [
                  Expanded(
                    child: _SummaryCard(
                      title: 'Total Balance',
                      amount: '¥1,000,000',
                      subtitle: '↑8.2% this month',
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
                      title: 'Income',
                      amount: '¥200,000',
                      subtitle: 'This month',
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
                      title: 'Expense',
                      amount: '¥90,000',
                      subtitle: '↓ 5.5% this month',
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

            // ==========================================
            // CHARTS AND RECENT TRANSACTIONS
            // ==========================================
            if (isMobile)
              Column(
                children: [
                  const SavingsChart(),
                  const SizedBox(height: 24),
                  SpendingChart(selectedMonth: _selectedMonth),
                  const SizedBox(height: 24),
                  _RecentTransactions(transactions: _transactions),
                ],
              )
            else
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: 450,
                      child: SpendingChart(selectedMonth: _selectedMonth),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 1,
                    child: SizedBox(height: 450, child: const SavingsChart()),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 450,
                      child: _RecentTransactions(transactions: _transactions),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  // ================================================
  // CUSTOM CALENDAR
  // ================================================

  Widget _buildCalendar() {
    final firstDay = DateTime(_selectedMonth.year, _selectedMonth.month, 1);

    final daysInMonth = DateTime(
      _selectedMonth.year,
      _selectedMonth.month + 1,
      0,
    ).day;

    // Sunday = 0, Monday = 1, and so on.
    final leadingEmptyDays = firstDay.weekday % 7;

    const weekdays = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

    return Container(
      width: 280,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Month navigation
          Row(
            children: [
              IconButton(
                visualDensity: VisualDensity.compact,
                onPressed: () {
                  setState(() {
                    _selectedMonth = DateTime(
                      _selectedMonth.year,
                      _selectedMonth.month - 1,
                    );
                  });
                },
                icon: const Icon(Icons.chevron_left, color: Colors.white70),
              ),

              Expanded(
                child: Text(
                  DateFormat('MMMM yyyy').format(_selectedMonth),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              IconButton(
                visualDensity: VisualDensity.compact,
                onPressed: () {
                  setState(() {
                    _selectedMonth = DateTime(
                      _selectedMonth.year,
                      _selectedMonth.month + 1,
                    );
                  });
                },
                icon: const Icon(Icons.chevron_right, color: Colors.white70),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Weekday labels
          Row(
            children: weekdays.map((weekday) {
              return Expanded(
                child: Center(
                  child: Text(
                    weekday,
                    style: const TextStyle(
                      color: Colors.white54,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 6),

          // Days of the month
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1.1,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemCount: leadingEmptyDays + daysInMonth,
            itemBuilder: (context, index) {
              if (index < leadingEmptyDays) {
                return const SizedBox.shrink();
              }

              final day = index - leadingEmptyDays + 1;

              final isToday =
                  _selectedMonth.year == DateTime.now().year &&
                  _selectedMonth.month == DateTime.now().month &&
                  day == DateTime.now().day;

              return InkWell(
                onTap: () {
                  setState(() {
                    _showCalendar = false;
                  });
                },
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isToday
                        ? const Color(0xFF4F46E5)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '$day',
                    style: TextStyle(
                      color: isToday ? Colors.white : Colors.white70,
                      fontSize: 12,
                      fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
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
              Icon(icon, color: Colors.white70, size: 20),
            ],
          ),

          const SizedBox(height: 24),

          Text(
            amount,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

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
                'Savings',
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
                  children: const [
                    Text(
                      '10%',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '¥100,000',
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

          Text(
            'Savings Goal',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.5),
              fontSize: 12,
            ),
          ),

          const SizedBox(height: 4),

          const Text(
            '¥1,000,000',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
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
              widthFactor: 0.1,
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
              label: const Text('Add Savings'),
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
// RECENT TRANSACTIONS
// ======================================================

class _RecentTransactions extends StatelessWidget {
  final List<Transaction> transactions;

  const _RecentTransactions({required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children:[
              const Text(
                'Recent Transactions',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  //later
                },
                child: Text(
                  "View more",
                  style: TextStyle(
                    color: Colors.cyanAccent,
                  )
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          ...transactions.map((transaction) {
            return ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                transaction.isIncome ? Icons.attach_money : Icons.money_off,
                color: transaction.isIncome ? Colors.green : Colors.red,
              ),
              title: Text(
                transaction.title,
                style: const TextStyle(color: Colors.white),
              ),
              trailing: Text(
                '${transaction.isIncome ? '+' : '-'}¥${NumberFormat('#,###').format(transaction.amount.abs())}',
                style: TextStyle(
                  color: transaction.isIncome
                      ? Colors.greenAccent
                      : Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

// ======================================================
// SPENDING OVER TIME CHART
// ======================================================

class SpendingChart extends StatelessWidget {
  final DateTime selectedMonth;

  const SpendingChart({super.key, required this.selectedMonth});

  static const List<double> _incomeValues = [
    1200,
    1700,
    1400,
    2100,
    1800,
    2500,
    2300,
    1700,
    1800,
    1750,
    2000,
    2450,
  ];

  static const List<double> _expenseValues = [
    900,
    1100,
    1000,
    1400,
    1300,
    1600,
    1500,
    2000,
    1500,
    2500,
    300,
    2890,
  ];

  static const List<String> _months = [
    'jan',
    'feb',
    'mar',
    'apr',
    'may',
    'jun',
    'jul',
    'aug',
    'sep',
    'oct',
    'nov',
    'dec',
  ];

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
            color: const Color(0xFF00E5FF).withValues(alpha: 0.15),
            blurRadius: 25,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Spending Over Time',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          // Chart legend
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
              const Text('Income', style: TextStyle(color: Colors.white70)),
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
              const Text('Expense', style: TextStyle(color: Colors.white70)),
            ],
          ),

          const SizedBox(height: 8),

          Expanded(
            child: LineChart(
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
                              ? 'Income\nÂ¥${spot.y.toInt()}'
                              : 'Expense\nÂ¥${spot.y.toInt()}',
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
                        final index = value.toInt();

                        if (index < 0 || index >= _months.length) {
                          return const SizedBox.shrink();
                        }

                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            _months[index],
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
                    spots: List.generate(
                      _incomeValues.length,
                      (index) => FlSpot(index.toDouble(), _incomeValues[index]),
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      color: Colors.cyanAccent.withValues(alpha: 0.12),
                    ),
                  ),

                  // Expense
                  LineChartBarData(
                    isCurved: true,
                    color: Colors.pinkAccent,
                    barWidth: 4,
                    dotData: const FlDotData(show: true),
                    spots: List.generate(
                      _expenseValues.length,
                      (index) =>
                          FlSpot(index.toDouble(), _expenseValues[index]),
                    ),
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
