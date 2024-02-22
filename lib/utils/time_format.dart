import 'package:intl/intl.dart';

class TimeFormat {
  String timeString;

  TimeFormat({required this.timeString});

  String timeConvert() {
    List<String> parts = timeString.split(':');
    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1]);

    // Use DateTime constructor with today's date and the parsed hour and minute
    DateTime time = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, hour, minute);

    // Formatting the time in 12-hour format with Bangla locale
    String formattedTime = DateFormat('hh:mm ', 'bn').format(time);

    return formattedTime;
  }
}

