import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/features/home/presentation/views/Diary_view/widgets/time_extension.dart';

class CustomBuildCalendar extends StatefulWidget {
  final Function(DateTime) onDateSelected;
  final DateTime selectedDate;

  const CustomBuildCalendar({
    super.key,
    required this.onDateSelected,
    required this.selectedDate,
  });

  @override
  State<CustomBuildCalendar> createState() => _CustomBuildCalendarState();
}

class _CustomBuildCalendarState extends State<CustomBuildCalendar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: EasyInfiniteDateTimeLine(
          dayProps: const EasyDayProps(
            dayStructure: DayStructure.dayStrDayNum,
            width: 60,
            height: 80,
          ),
          firstDate: DateTime.now().subtract(const Duration(days: 365)),
          focusDate: widget.selectedDate,
          lastDate: DateTime.now().add(const Duration(days: 365)),
          onDateChange: widget.onDateSelected,
          headerBuilder: (context, date) {
            return const SizedBox.shrink();
          },
          itemBuilder: (context, date, isSelected, onTap) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: InkWell(
                onTap: () {
                  widget.onDateSelected(date);
                  onTap();
                },
                child: Container(
                  height: 80,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: isSelected ? kSecondaryColor : Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          date.dayName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 15,
                          child: Text(
                            date.day.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
