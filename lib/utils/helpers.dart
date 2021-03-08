class DateUtils {
  static bool isSameDate(DateTime d1, DateTime d2) {
    var d1s = DateTime(d1.year, d1.month, d1.day);
    var d2s = DateTime(d2.year, d2.month, d2.day);

    return d1s == d2s;
  }

  static bool isToday(DateTime d) {
    var now = DateTime.now();
    return DateUtils.isSameDate(now, d);
  }

  static int getDaysToBeSubtracted(List<bool> repeats, int currentDay) {
    int i = currentDay;
    int counter = 0;

    while (true) {
      if (i == 0) {
        i = 6;
      } else {
        i = i - 1;
      }

      counter++;
      if (repeats[i] == true) {
        break;
      }
    }

    return counter;
  }

  static DateTime getPreviousDayFromRepeats(List<bool> repeats, DateTime dt) {
    int currWeekday = dt.weekday - 1;
    int daysToBeSub = DateUtils.getDaysToBeSubtracted(repeats, currWeekday);
    return dt.subtract(Duration(days: daysToBeSub));
  }
}
