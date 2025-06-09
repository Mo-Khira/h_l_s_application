import 'package:flutter/material.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:intl/intl.dart';

class DateHeader extends StatelessWidget {
  final DateTime selectedDate;
  final void Function(bool isNext) onChangeMonth;

  const DateHeader({
    super.key,
    required this.selectedDate,
    required this.onChangeMonth,
  });

  @override
  Widget build(BuildContext context) {
    final monthYear = DateFormat.yMMMM().format(selectedDate); // February 2024

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          const Icon(Icons.calendar_month_outlined,
              size: 20, color: Colors.white),
          const SizedBox(width: 10),
          Text("Date", style: Styles.textStyle16),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.arrow_left, color: Colors.white),
            onPressed: () => onChangeMonth(false),
          ),
          Text(monthYear, style: Styles.textStyle16),
          IconButton(
            icon: const Icon(Icons.arrow_right, color: Colors.white),
            onPressed: () => onChangeMonth(true),
          ),
        ],
      ),
    );
  }
}
