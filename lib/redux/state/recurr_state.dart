import 'package:recurr_fe/models/recurr.dart';

class RecurrState {
  final List<Recurr> recurrs;

  const RecurrState({
    this.recurrs = const [],
  });

  RecurrState copyWith({
    List<Recurr> recurrs,
  }) =>
      RecurrState(
        recurrs: recurrs ?? this.recurrs,
      );

  static RecurrState fromJson(dynamic json) {
    return RecurrState(
      recurrs: const [],
    );
  }

  dynamic toJson() => {
        "recurrs": recurrs.map((recur) => recur.toJson()).toList(),
      };
}
