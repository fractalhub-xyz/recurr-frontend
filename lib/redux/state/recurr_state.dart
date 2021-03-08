import 'package:recurr_fe/models/recurr.dart';

class RecurrState {
  final List<Recurr> recurrList;

  const RecurrState({
    this.recurrList = const [],
  });

  RecurrState copyWith({
    List<Recurr> recurrs,
  }) =>
      RecurrState(
        recurrList: recurrs ?? this.recurrList,
      );

  static RecurrState fromJson(dynamic json) {
    List<Recurr> recurrs = json["recurrs"]
        .map((recurrJson) => Recurr.fromJson(recurrJson))
        .toList();

    return RecurrState(
      recurrList: recurrs,
    );
  }

  dynamic toJson() => recurrList.map((recur) => recur.toJson()).toList();
}
