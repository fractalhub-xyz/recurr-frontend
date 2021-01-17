import 'package:recurr_fe/models/recurr.dart';

class AppState {
  final List<Recurr> recurrs;

  // curly braces for named parameters
  // need to initial because member is final
  AppState({this.recurrs = const []});

  /*
    State Persistence
    (Whenever a new state is added, the below methods needs to be updated)
    Refer: https://github.com/Cretezy/redux_persist/tree/master/packages/redux_persist
   */
  AppState copyWith({List<Recurr> recurrs}) =>
      AppState(recurrs: recurrs ?? this.recurrs);

  static AppState fromJson(dynamic json) {
    if (json == null) {
      return AppState();
    }

    return AppState(
        recurrs:
            json["recurrs"]?.map((recurrJson) => Recurr.fromJson(recurrJson)));
  }

  dynamic toJson() =>
      {"recurrs": recurrs.map((recur) => recur.toJson()).toList()};
}
