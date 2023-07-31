//timeStamp to DateTime
import 'package:intl/intl.dart';

// add date to DateTime
int addMonthsToDate(int months) {
  final dateTime = DateTime.now();
  final updateDate =
      DateTime(dateTime.year, dateTime.month + months, dateTime.day);
  return dateTimeToTimeStamp(updateDate);
}

DateTime timeStampToDateTime(int timeStamp) {
  return DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
}

DateTime parseDateString(String dateString) {
  List<String> dateParts = dateString.split('-');

  int day = int.parse(dateParts[0]);
  int month = int.parse(dateParts[1]);
  int year = int.parse(dateParts[2]);

  return DateTime(year, month, day);
}

// DateTime to timeStamp
int dateTimeToTimeStamp(DateTime dateTime) {
  return dateTime.millisecondsSinceEpoch ~/ 1000;
}

String timeStampToDateWithFormat(int timeStamp) {
  return DateFormat('dd-MM-yyyy').format(timeStampToDateTime(timeStamp));
}

DateTime? stringToDateWithFormat(String time) {
  if (time == "") return null;
  return parseDateString(time);
}

int calculateWeeksBetweenDate(
    {required DateTime fromTime, required DateTime toTime}) {
  var difference = toTime.difference(fromTime);
  int weeks = difference.inDays ~/ 7;
  return weeks;
}

int calculateMonthsBetweenDate(
    {required DateTime fromTime, required DateTime toTime}) {
  int months =
      (toTime.year * 12 + toTime.month) - (fromTime.year * 12 + fromTime.month);

  if (fromTime.day > toTime.day) {
    months--;
  }

  return months;
}

const String dateFormatter = 'MMMM dd, y';

extension DateHelper on DateTime {
  String formatDate() {
    final formatter = DateFormat(dateFormatter);
    return formatter.format(this);
  }

  bool isSameDate(DateTime other) {
    return this.year == other.year &&
        this.month == other.month &&
        this.day == other.day;
  }

  bool isYesterday() {
    final yesterday = DateTime.now().subtract(Duration(days: 1));
    return this.isSameDate(yesterday);
  }

  bool isBeforeYesterday() {
    final yesterday = DateTime.now().subtract(Duration(days: 1));
    return this.isBefore(yesterday);
  }

  bool isToday() {
    return this.isSameDate(DateTime.now());
  }

  bool isThisWeek() {
    final today = DateTime.now();
    final weekAgo = today.subtract(Duration(days: 7));
    return this.isAfter(weekAgo);
  }

  String getTimePassed() {
    DateTime finalDate = DateTime.now();

    Duration duration = finalDate.difference(this);

    if (duration.inMinutes < 60) {
      return "${duration.inMinutes} min";
    } else if (duration.inHours < 24) {
      return "${duration.inHours} h";
    } else if (duration.inDays < 7) {
      return "${duration.inDays} d";
    } else if (duration.inDays < 30) {
      return "${duration.inDays ~/ 7} w";
    } else if (duration.inDays < 365) {
      return "${duration.inDays ~/ 30} m";
    } else {
      return "${duration.inDays ~/ 365} y";
    }
  }
}
