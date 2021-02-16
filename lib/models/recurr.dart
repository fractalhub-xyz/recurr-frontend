import 'dart:convert';
import 'dart:ffi';
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
    repeats = jsonDecode(json["repeats"]).cast<bool>().toList();

    json["checkins"]?.forEach((key, value) {
      checkins[key] = Checkin.fromJson(value);
    });
    var dbyday = DateTime(2021, 2, 1, 22);
    var yday = DateTime(2021, 2, 2, 22);
    addNewCheckin(yday);
    addNewCheckin(dbyday);
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
    if (checkins.length == 0) {
      return 0;
    }

    int streak = 0;
    // Current checkin index
    int i = 0;
    DateTime current = DateTime.now();
    // today
    if (repeats[current.weekday - 1] && isCheckedInToday()) {
      streak += 1;
      i += 1;
    }

    // For calculating previous streak
    while (i < checkins.length) {
      current = DateUtils.getPreviousDayFromRepeats(repeats, current);

      if (repeats[current.weekday - 1] && !isCheckedInOnDate(current)) {
        break;
      }

      streak = streak + 1;
      i = i + 1;
    }

    return streak;
  }

  static List<Recurr> getTodaysRecurrs(List<Recurr> recurrs) {
    int weekday = DateTime.now().weekday - 1;
    List<Recurr> todaysRecurrs =
        recurrs.where((rcr) => rcr.repeats[weekday]).toList();
    todaysRecurrs.sort((Recurr a, Recurr b) {
      if (a.isCheckedInToday()) {
        return 1;
      } else {
        return 0;
      }
    });
    return todaysRecurrs;
  }

  static List<Recurr> getRecurrsByDate(List<Recurr> recurrs, DateTime date) {
    return recurrs.where((rcr) => rcr.repeats[date.weekday - 1]).toList();
  }

  static List<Recurr> getCheckedInRecursByDate(
      List<Recurr> recurrs, DateTime date) {
    var rcrs = getRecurrsByDate(recurrs, date);
    return rcrs.where((rcr) => rcr.isCheckedInOnDate(date));
  }

  static List<Recurr> getOtherRecurrs(List<Recurr> recurrs) {
    int weekday = DateTime.now().weekday - 1;
    return recurrs.where((rcr) => !rcr.repeats[weekday]).toList();
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
  }

  static List<Recurr> getRecurrsToCheckIn(List<Recurr> recurrs) {
    var todaysRecurs = Recurr.getTodaysRecurrs(recurrs);
    return todaysRecurs.where((rcr) => !rcr.isCheckedInToday()).toList();
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
