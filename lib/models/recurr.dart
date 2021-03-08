import 'dart:convert';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:recurr_fe/models/checkin.dart';
import 'package:recurr_fe/utils/helpers.dart';

class Recurr {
  String id, title, createdAt, team;
  int duration;
  double weight;
  List<bool> repeats;
  Map<String, Checkin> checkins = {};
  int currentStreak = 0;
  int maxStreak = 0;

  Recurr(this.id, this.title, this.createdAt, this.team, this.duration,
      this.weight, this.repeats);

  Map toJson() => {
        "id": id,
        "title": title,
        "duration": duration,
        "createdAt": createdAt,
        "team": team,
        "weight": weight,
        "repeats": jsonEncode(repeats),
        "currentStreak": currentStreak,
        "maxStreak": maxStreak,
        "checkins": checkins.map((key, value) => MapEntry(key, value.toJson())),
      };

  // Named Constructor (https://dart.dev/guides/language/language-tour#using-constructors)
  Recurr.fromJson(dynamic json) {
    id = json["id"];
    title = json["title"];
    duration = json["duration"];
    createdAt = json["createdAt"];
    team = json["team"];
    weight = json["weight"];
    currentStreak = json["currentStreak"];
    maxStreak = json["maxStreak"];
    repeats = jsonDecode(json["repeats"]).cast<bool>().toList();

    json["checkins"]?.forEach((key, value) {
      checkins[key] = Checkin.fromJson(value);
    });
  }

  // Methods
  String getRepeatString() {
    bool isEveryday = repeats.every((day) => day);
    if (isEveryday) {
      return "Everyday";
    }

    List<String> days = ['Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat', 'Sun'];
    days.removeWhere((day) {
      int idx = days.indexOf(day);
      return !repeats[idx];
    });

    return days.join(" ");
  }

  int getStreak() {
    // check whether streak is valid
    var today = DateTime.now();
    var prevDate = DateUtils.getPreviousDayFromRepeats(repeats, today);

    if (!isCheckedInToday() && !isCheckedInOnDate(prevDate)) {
      currentStreak = 0;
    }

    return currentStreak;
  }

  int getMaxStreak() {
    return maxStreak;
  }

  int getTotalDays() {
    return checkins.length;
  }

  String getCheckinKey(DateTime dt, [User user]) {
    if (user == null) {
      user = FirebaseAuth.instance.currentUser;
    }
    var date = "${dt.year}_${dt.month}_${dt.day}";
    return "${user.uid}__$date";
  }

  bool isCheckedInToday() => isCheckedInOnDate(DateTime.now());

  bool isCheckedInOnDate(DateTime date, [User user]) {
    if (checkins.length == 0) {
      return false;
    }

    var key = getCheckinKey(date, user);
    return checkins.containsKey(key);
  }

  void addNewCheckin(DateTime dt, [User user]) {
    if (user == null) {
      user = FirebaseAuth.instance.currentUser;
    }

    var key = getCheckinKey(dt, user);
    checkins[key] = Checkin(timestamp: dt, user: user.uid);
    setStreak(dt);
    setMaxStreak();
  }

  void setStreak(DateTime checkinTime) {
    DateTime prevDate =
        DateUtils.getPreviousDayFromRepeats(repeats, checkinTime);

    if (isCheckedInOnDate(prevDate)) {
      currentStreak = currentStreak + 1;
    } else {
      currentStreak = 1;
    }
  }

  void setMaxStreak() {
    if (currentStreak > maxStreak) {
      maxStreak = currentStreak;
    }
  }

  // Returns last X day window as an array of int
  // if checked 1 (in future, this might be the value of check in), else 0
  List<int> _getLastXDays(int x) {
    List<int> lastXDays = [];
    // We start out with tomo, so we don't have to add special cnditin fr tday
    DateTime current = DateTime.now().add(Duration(days: 1));

    int i = 0;
    while (i < x) {
      current = DateUtils.getPreviousDayFromRepeats(repeats, current);
      print(current);
      if (isCheckedInOnDate(current)) {
        lastXDays.insert(0, 1);
      } else {
        lastXDays.insert(0, 0);
      }

      i = i + 1;
    }

    return lastXDays;
  }

  List<FlSpot> getMomentum() {
    List<int> last14Days = _getLastXDays(14);
    List<FlSpot> flspt = [];
    double base = 2;
    int exp = 0;

    last14Days.asMap().forEach((idx, value) {
      if (value != 0) {
        exp++;
      }

      flspt.add(FlSpot(idx.toDouble(), pow(base, exp)));
    });

    print("Last 14 days: $last14Days");
    print("Momentum: $flspt");

    return flspt;
  }
}
