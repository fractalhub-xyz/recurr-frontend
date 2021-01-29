import 'dart:convert';

class Recurr {
  String id, title, createdAt, team;
  int duration;
  double weight;
  List<bool> repeats;

  Recurr(this.id, this.title, this.createdAt, this.team, this.duration,
      this.weight, this.repeats);

  Map toJson() => {
        "id": id,
        "title": title,
        "duration": duration,
        "createdAt": createdAt,
        "team": team,
        "weight": weight,
        "repeats": jsonEncode(repeats)
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
  }

  String getRepeatString() {
    bool isEveryday = repeats.every((day) => day);
    if (isEveryday) {
      return "Everyday";
    }

    List<String> days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat'];
    days.removeWhere((day) {
      int idx = days.indexOf(day);
      return !repeats[idx];
    });

    return days.join(" ");
  }
}
