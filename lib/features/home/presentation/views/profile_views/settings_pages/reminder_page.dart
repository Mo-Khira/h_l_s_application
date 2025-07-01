import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/core/utils/app_router.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_login_button.dart';
import 'package:h_l_s_application/features/home/presentation/views/Diary_view/widgets/custom_build_calendar.dart';
import 'package:h_l_s_application/features/home/presentation/views/profile_views/settings_pages/widgets/date_header.dart';
import 'package:h_l_s_application/features/home/presentation/views/profile_views/settings_pages/widgets/reminder_time_picker.dart';
import 'package:h_l_s_application/features/home/presentation/views/profile_views/settings_pages/widgets/reminder_toggle.dart';

class ReminderPage extends StatefulWidget {
  const ReminderPage({super.key});

  @override
  State<ReminderPage> createState() => _ReminderPage();
}

class _ReminderPage extends State<ReminderPage> {
  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay.now();
  bool isReminderOn = true;

  void _changeMonth(bool isNext) {
    setState(() {
      selectedDate = DateTime(
        selectedDate.year,
        selectedDate.month + (isNext ? 1 : -1),
        selectedDate.day,
      );
    });
  }

  void _onDateSelected(DateTime newDate) {
    setState(() => selectedDate = newDate);
  }

  void _handleCreate() {
    GoRouter.of(context).push(AppRouter.kReminderCreatedPage);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back,
                          color: Colors.white, size: 28),
                      onPressed: () => GoRouter.of(context).pop(),
                    ),
                    Text(
                      "Reminder",
                      style: Styles.textStyle20
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 28),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              DateHeader(
                selectedDate: selectedDate,
                onChangeMonth: _changeMonth,
              ),
              const SizedBox(height: 40),
              CustomBuildCalendar(
                onDateSelected: _onDateSelected,
                selectedDate: selectedDate,
              ),
              const SizedBox(height: 20),
              ReminderTimePicker(
                initialTime: selectedTime,
                onTimeSelected: (time) {
                  setState(() {
                    selectedTime = time;
                  });
                },
              ),
              const SizedBox(height: 40),
              ReminderToggle(
                isOn: isReminderOn,
                onToggle: (value) {
                  setState(() {
                    isReminderOn = value;
                  });
                },
              ),
              const Expanded(
                child: SizedBox(),
              ),
              CustomLoginButton(
                onPressed: _handleCreate,
                text: 'Create',
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
