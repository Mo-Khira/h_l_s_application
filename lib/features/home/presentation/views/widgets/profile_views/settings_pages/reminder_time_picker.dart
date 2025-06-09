import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/styles.dart';

class ReminderTimePicker extends StatelessWidget {
  final TimeOfDay initialTime;
  final ValueChanged<TimeOfDay> onTimeSelected;

  const ReminderTimePicker({
    super.key,
    required this.initialTime,
    required this.onTimeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.access_time, color: Colors.white),
        const SizedBox(width: 10),
        Text("Time", style: Styles.textStyle16.copyWith(color: Colors.white)),
        const Spacer(),
        InkWell(
          onTap: () async {
            final pickedTime = await showTimePicker(
              context: context,
              initialTime: initialTime,
              builder: (context, child) => Theme(
                data: ThemeData.dark(), // أو أي تخصيص للستايل
                child: child!,
              ),
            );
            if (pickedTime != null) {
              onTimeSelected(pickedTime);
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              initialTime.format(context),
              style: Styles.textStyle14.copyWith(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
