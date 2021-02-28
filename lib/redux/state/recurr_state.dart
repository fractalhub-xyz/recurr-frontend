import 'package:recurr_fe/models/recurr.dart';

class RecurrState {
  final List<Recurr> recurrs;

  const RecurrState({
    this.recurrs = const [],
  });

  RecurrState copyWith({
    List<Recurr> recurrs,
  }) => RecurrState(
      recurrs: recurrs ?? this.recurrs,
  );
}