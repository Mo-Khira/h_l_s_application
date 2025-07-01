import 'package:intl/intl.dart';

extension TimeExtension on DateTime {
  String get toFormattedDate {
    DateFormat formatter = DateFormat("dd/MM/yyyy");
    return formatter.format(this);
  }

  String get dayName {
    List<String> days = ["Sat", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri"];
    return days[weekday - 1];
  }

  String get days {
    List<String> days = [
      "Saturday",
      "Sunday",
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday"
    ];
    return days[weekday - 1];
  }
}
