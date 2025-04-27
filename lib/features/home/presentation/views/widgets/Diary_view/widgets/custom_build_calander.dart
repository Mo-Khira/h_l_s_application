import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/Diary_view/extentations/time_extention.dart';

class customBuildCalender extends StatefulWidget {
  const customBuildCalender({super.key});

  @override
  State<customBuildCalender> createState() => _customBuildCalenderState();
}

class _customBuildCalenderState extends State<customBuildCalender> {
  DateTime selectcalenderdate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: EasyInfiniteDateTimeLine(
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          focusDate: selectcalenderdate,
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateChange: (selectedDate) {},
          headerBuilder: (context, date) {
            return SizedBox.shrink();
          },
          itemBuilder: (context, date, isSelected, ondatetapped) {
            return InkWell(
              onTap: () {
                setState(() {
                  selectcalenderdate = date;
                });
                ondatetapped();
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
                        style: TextStyle(
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
                        style: TextStyle(
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
