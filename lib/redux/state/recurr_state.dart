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
        .cast<Recurr>()
        .toList();

    return RecurrState(
      recurrList: recurrs,
    );
  }

  dynamic toJson() => recurrList.map((recur) => recur.toJson()).toList();

  List<Recurr> getTodaysRecurrs() {
    int weekday = DateTime.now().weekday - 1;
    var todaysRecurrs =
        recurrList.where((rcr) => rcr.repeats[weekday]).toList();

    todaysRecurrs.sort((Recurr a, Recurr b) => a.isCheckedInToday() ? 1 : 0);

    return todaysRecurrs;
  }

  List<Recurr> getRecurrsToCheckIn() {
    var todaysRecurs = getTodaysRecurrs();
    return todaysRecurs.where((rcr) => !rcr.isCheckedInToday()).toList();
  }

  List<Recurr> getRecurrsByDate(DateTime date) {
    return recurrList.where((rcr) => rcr.repeats[date.weekday - 1]).toList();
  }

  List<Recurr> getCheckedInRecursByDate(DateTime date) {
    var rcrs = getRecurrsByDate(date);
    return rcrs.where((rcr) => rcr.isCheckedInOnDate(date));
  }

  List<Recurr> getOtherRecurrs() {
    int weekday = DateTime.now().weekday - 1;
    return recurrList.where((rcr) => !rcr.repeats[weekday]).toList();
  }
}
