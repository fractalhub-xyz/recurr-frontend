
class Checkin {
  String user;
  DateTime timestamp;

  Checkin({
    this.user, this.timestamp
  });

  toJson() => {
    "user": user,
    "timestamp": timestamp.toIso8601String(),
  };

  Checkin.fromJson(dynamic json) {
    user = json["user"];
    timestamp = DateTime.parse(json["timestamp"]);
  }
}