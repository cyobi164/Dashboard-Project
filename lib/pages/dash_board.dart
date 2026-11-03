//import 'package:app/main.dart';
//import 'package:app/features/dashboard/dashboard_shell.dart';
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
      color: const Color(0xFFF4F5FA),
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
                          color: Color(0xFF202844),
                          fontSize: isMobile ? 26 : 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Good evening 👋",
                        style: TextStyle(
                          color: Color(0xFF202844),
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Overview.',
                        style: TextStyle(
                          color: Color(0xFF8992AB),
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
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFEAECF2)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.calendar_month_outlined,
                              color: Color(0xFF68718A),
                              size: 18,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              DateFormat('MMM').format(_selectedMonth),
                              style: const TextStyle(
                                color: Color(0xFF202844),
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
            if (MediaQuery.of(context).size.width < 900)
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
            // ==========================================
            // CHARTS, RECENT TRANSACTIONS AND UPCOMING BILLS
            // ==========================================
            LayoutBuilder(
              builder: (context, constraints) {
                // Narrow screens: stack cards vertically.
                if (constraints.maxWidth < 1100) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SpendingChart(selectedMonth: _selectedMonth),
                      const SizedBox(height: 16),
                      const SavingsChart(),
                      const SizedBox(height: 16),
                      _RecentTransactions(transactions: _transactions),
                      const SizedBox(height: 16),
                      const _UpcomingBills(),
                    ],
                  );
                }

                // Desktop: display three columns.
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Column 1: Spending chart
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        height: 450,
                        child: SpendingChart(selectedMonth: _selectedMonth),
                      ),
                    ),

                    const SizedBox(width: 16),

                    // Column 2: Savings chart
                    const Expanded(
                      flex: 1,
                      child: SizedBox(height: 450, child: SavingsChart()),
                    ),

                    const SizedBox(width: 16),

                    // Column 3: Transactions and bills.
                    // Use fixed heights instead of Expanded here.
                    // This avoids the unbounded-height RenderFlex error.
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 450,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 240,
                              child: _RecentTransactions(
                                transactions: _transactions,
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Expanded(child: _UpcomingBills()),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
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
    final bool isBalance = title == "Total Balance";

    final Color cardColor = isBalance ? const Color(0xFF6975F8) : Colors.white;
    final Color textColor = isBalance ? Colors.white : const Color(0xFF202844);
    final Color lableColor = isBalance ? Colors.white : const Color(0xFF68718A);

    final Color changeColor = isBalance
        ? const Color(0xFFB9F8D7)
        : title == "Income"
        ? const Color(0xFF159C7D)
        : const Color(0xFFEA685A);

    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(14),
        border: isBalance ? null : Border.all(color: const Color(0xFFEAECF2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title == "Expense"
                    ? "Total expenses"
                    : title == "Income"
                    ? "Total income"
                    : "Total balance",
                style: TextStyle(
                  color: lableColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isBalance
                      ? Colors.white.withValues(alpha: 0.18)
                      : const Color(0xFFF1F2FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  color: isBalance ? Colors.white : const Color(0xFF6975F8),
                  size: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            amount,
            style: TextStyle(
              color: textColor,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: TextStyle(
              color: changeColor,
              fontSize: 12,
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
    const double savedAmount = 80000;
    const double savingsGoal = 1000000;
    const double progress = savedAmount / savingsGoal;

    final double remaining = savingsGoal - savedAmount;

    final currencyFormat = NumberFormat("#,###");

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFEAECF2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Savings goal",
                style: TextStyle(
                  color: Color(0xFF202844),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFEAECF2)),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: const Icon(
                  Icons.more_horiz,
                  color: Color(0xFF8992AB),
                  size: 18,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          //Circular progress chart
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
                        value: progress * 100,
                        color: const Color(0xFF6975F8),
                        radius: 16,
                        showTitle: false,
                      ),
                      PieChartSectionData(
                        value: (1 - progress) * 100,
                        color: const Color(0xFFEDF0FA),
                        radius: 16,
                        showTitle: false,
                      ),
                    ],
                  ),
                ),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${(progress * 100).round()}%',
                      style: const TextStyle(
                        color: Color(0xFF202844),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Completed",
                      style: TextStyle(color: Color(0xFF8992AB), fontSize: 11),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 4),

          // saved amount
          Center(
            child: Text(
              "of  ¥${currencyFormat.format(savingsGoal)} Goal",
              style: const TextStyle(color: Color(0xFF8992AB), fontSize: 11),
            ),
          ),
          const SizedBox(height: 16),

          //horizontal bar
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 6,
              backgroundColor: const Color(0xFFEDF0FA),
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFF6975F8),
              ),
            ),
          ),

          const SizedBox(height: 12),

          //remaining amount
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Still to go",
                style: TextStyle(color: Color(0xFF8992AB), fontSize: 11),
              ),
              Text(
                "¥${currencyFormat.format(remaining)}",
                style: const TextStyle(
                  color: Color(0xFF202844),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          //add saving button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, size: 16),
              label: const Text("Add to savings"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF6975F8),
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFEAECF2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Recent Transactions',
                style: TextStyle(
                  color: Color(0xFF202844),
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
                  style: TextStyle(color: Color(0xFF6975F8)),
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
                color: transaction.isIncome
                    ? const Color(0xFF159C7D)
                    : const Color(0xFFD96B62),
              ),
              title: Text(
                transaction.title,
                style: const TextStyle(
                  color: Color(0xFF202844),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Text(
                '${transaction.isIncome ? '+' : '-'}¥${NumberFormat('#,###').format(transaction.amount.abs())}',
                style: TextStyle(
                  color: transaction.isIncome
                      ? const Color(0xFF159C7D)
                      : const Color(0xFF202844),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  letterSpacing: -0.3,
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
// Upcoming Bills
// ======================================================

class _UpcomingBills extends StatelessWidget {
  const _UpcomingBills();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFEAECF2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Upcoming Bills',
                style: TextStyle(
                  color: Color(0xFF202844),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.receipt_long_outlined,
                color: Color(0xFF6975F8).withValues(alpha: 0.6),
              ),
            ],
          ),
          const SizedBox(height: 8),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _billRow(
                    icon: Icons.home_outlined,
                    title: 'Rent',
                    amount: '¥124,000',
                    dueDate: 'Due: 2026-10-10',
                    color: Color(0xFFD99550),
                  ),
                  const Divider(color: Color(0xFFEAECF2), height: 12),

                  _billRow(
                    icon: Icons.electric_bolt_outlined,
                    title: 'Electricity',
                    amount: '¥8,500',
                    dueDate: 'Due: 2026-10-20',
                    color: Color(0xFFB69A38),
                  ),
                  const Divider(color: Color(0xFFEAECF2), height: 12),

                  _billRow(
                    icon: Icons.water_drop_outlined,
                    title: 'Water',
                    amount: '¥5,200',
                    dueDate: 'Due: 2026-10-25',
                    color: Color(0xFF568BC7),
                  ),
                  const Divider(color: Color(0xFFEAECF2), height: 12),

                  _billRow(
                    icon: Icons.wifi_outlined,
                    title: 'Internet',
                    amount: '¥6,040',
                    dueDate: 'Due: 2026-10-30',
                    color: Color(0xFF8B79C6),
                  ),
                  const Divider(color: Color(0xFFEAECF2), height: 12),

                  _billRow(
                    icon: Icons.phone_android_outlined,
                    title: 'Mobile',
                    amount: '¥14,500',
                    dueDate: 'Due: 2026-10-15',
                    color: Color(0xFF159C7D),
                  ),
                  const Divider(color: Color(0xFFEAECF2), height: 12),

                  _billRow(
                    icon: Icons.local_gas_station_outlined,
                    title: 'Gas',
                    amount: '¥4,800',
                    dueDate: 'Due: 2026-10-18',
                    color: Color(0xFFD96B62),
                  ),
                  const Divider(color: Color(0xFFEAECF2), height: 12),

                  _billRow(
                    icon: Icons.play_circle_outline,
                    title: 'Netflix',
                    amount: '¥1,200',
                    dueDate: 'Due: 2026-10-22',
                    color: Color(0xFFC8799A),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _billRow({
    required IconData icon,
    required String title,
    required String amount,
    required String dueDate,
    required Color color,
  }) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color, size: 18),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF202844),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                dueDate,
                style: const TextStyle(color: Color(0xFF8992AB), fontSize: 10),
              ),
            ],
          ),
        ),
        const SizedBox(width: 6),
        Text(
          amount,
          style: const TextStyle(
            color: Color(0xFF202844),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
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
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  @override
  Widget build(BuildContext context) {
    const darkPurple = Color(0xFF6975F8);
    const lightPurple = Color(0xFFC9CEFF);
    const darkText = Color(0xFF202844);
    const secondaryText = Color(0xFF8992AB);
    const gridColor = Color(0xFFEAECF2);

    //calculate the remains after expenses
    final savingsValues = List.generate(
      _incomeValues.length,
      (index) => (_incomeValues[index] - _expenseValues[index])
          .clamp(0.0, double.infinity)
          .toDouble(),
    );

    //create the stack bar for each month
    final barGroups = List.generate(_months.length, (index) {
      final expenses = _expenseValues[index];
      final savings = savingsValues[index];
      final total = expenses + savings;

      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: total,
            width: 20,
            borderRadius: BorderRadius.circular(4),
            rodStackItems: [
              // dark purple = money spent
              BarChartRodStackItem(0, expenses, darkPurple),

              // light purple = money remaining
              if (savings > 0)
                BarChartRodStackItem(expenses, total, lightPurple),
            ],
          ),
        ],
      );
    });

    return Container(
      height: Responsive.isMobile(context) ? 300 : 450,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: gridColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Cash Flow",
            style: TextStyle(
              color: darkText,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          const Text(
            "Monthly spending and savings",
            style: TextStyle(color: secondaryText, fontSize: 12),
          ),

          const SizedBox(height: 16),

          //chart legend.
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: darkPurple,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                "Spent",
                style: TextStyle(color: secondaryText, fontSize: 12),
              ),

              const SizedBox(width: 20),

              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: lightPurple,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                "Saved",
                style: TextStyle(color: secondaryText, fontSize: 12),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Expanded(
            child: BarChart(
              BarChartData(
                minY: 0,
                maxY: 3500,

                barGroups: barGroups,

                alignment: BarChartAlignment.spaceAround,

                barTouchData: BarTouchData(
                  enabled: true,
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      final index = group.x;

                      final spent = _expenseValues[index];
                      final saved = savingsValues[index];

                      return BarTooltipItem(
                        '${_months[index]}\n'
                        'Spent: ¥${spent.toInt()}\n'
                        'Saved: ¥${saved.toInt()}',
                        const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      );
                    },
                  ),
                ),

                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 500,
                  getDrawingHorizontalLine: (value) {
                    return const FlLine(color: gridColor, strokeWidth: 1);
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
                      getTitlesWidget: ((value, meta) {
                        final index = value.toInt();

                        if (index < 0 || index >= _months.length) {
                          return const SizedBox.shrink();
                        }

                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            _months[index],
                            style: const TextStyle(
                              color: secondaryText,
                              fontSize: 11,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
