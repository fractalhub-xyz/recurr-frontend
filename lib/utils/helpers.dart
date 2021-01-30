
class DateUtils {
  static bool isSameDate(DateTime d1, DateTime d2) {
  var d1_start = DateTime(d1.year, d1.month, d1.day);
  var d2_start = DateTime(d2.year, d2.month, d2.day);

  return d1_start == d2_start;
}

  static bool isToday(DateTime d) {
    var now = DateTime.now();
    return DateUtils.isSameDate(now, d);
  }
}