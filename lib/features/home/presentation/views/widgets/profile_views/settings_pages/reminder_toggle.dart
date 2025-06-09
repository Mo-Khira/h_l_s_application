import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/styles.dart';

class ReminderToggle extends StatelessWidget {
  final bool isOn;
  final ValueChanged<bool> onToggle;

  const ReminderToggle({
    super.key,
    required this.isOn,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.notifications, color: Colors.white),
        const SizedBox(width: 10),
        Text("Set Reminder",
            style: Styles.textStyle16.copyWith(color: Colors.white)),
        const Spacer(),
        Switch(
          value: isOn,
          onChanged: onToggle,
          activeColor: Colors.white,
          activeTrackColor: kSecondaryColor,
        ),
      ],
    );
  }
}
