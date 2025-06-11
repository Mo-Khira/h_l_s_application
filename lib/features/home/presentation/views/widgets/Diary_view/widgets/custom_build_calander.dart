import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/Diary_view/extentations/time_extention.dart';

class CustomBuildCalender extends StatefulWidget {
  final Function(DateTime) onDateSelected;
  final DateTime selectedDate;

  const CustomBuildCalender({
    super.key,
    required this.onDateSelected,
    required this.selectedDate,
  });

  @override
  State<CustomBuildCalender> createState() => _CustomBuildCalenderState();
}

class _CustomBuildCalenderState extends State<CustomBuildCalender> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: EasyInfiniteDateTimeLine(
          dayProps: const EasyDayProps(
            dayStructure: DayStructure.dayStrDayNum,
            width: 50,
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
            return InkWell(
              onTap: () {
                widget.onDateSelected(date);
                // widget.onDateSelected(date);
                onTap();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
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
                          fontSize: 17,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Center(
                      child: Text(
                        date.day.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
