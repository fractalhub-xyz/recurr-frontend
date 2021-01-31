import 'dart:convert';

import 'package:recurr_fe/models/checkin.dart';
import 'package:recurr_fe/utils/helpers.dart';

class Recurr {
  String id, title, createdAt, team;
  int duration;
  double weight;
  List<bool> repeats;
  List<Checkin> checkins = [];

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
        "checkins": checkins.map((c) => c.toJson()).toList(),
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
    if (json["checkins"] != null) {
      checkins = json["checkins"]
          .map((check) => Checkin.fromJson(check))
          .cast<Checkin>()
          .toList();
    }
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
  }

  static List<Recurr> getTodaysRecurrs(List<Recurr> recurrs) {
    int weekday = DateTime.now().weekday - 1;
    return recurrs.where((rcr) => rcr.repeats[weekday]).toList();
  }

  static List<Recurr> getRecurrsByDate(List<Recurr> recurrs, DateTime date) {
    return recurrs.where((rcr) => rcr.repeats[date.weekday - 1]).toList();
  }

  static List<Recurr> getOtherRecurrs(List<Recurr> recurrs) {
    int weekday = DateTime.now().weekday - 1;
    return recurrs.where((rcr) => !rcr.repeats[weekday]).toList();
  }

  bool isCheckedInToday() {
    if (checkins.length == 0) {
      return false;
    }

    Checkin lastCheckin = checkins[0];
    return DateUtils.isToday(lastCheckin.timestamp);
  }

  static List<Recurr> getRecurrsToCheckIn(List<Recurr> recurrs) {
    var todaysRecurs = Recurr.getTodaysRecurrs(recurrs);
    return todaysRecurs.where((rcr) => !rcr.isCheckedInToday()).toList();
  }
}
