import 'package:recurr_fe/models/recurr.dart';
import 'package:recurr_fe/redux/state/sync_state.dart';

class AppState {
  final List<Recurr> recurrs;
  final SyncState sync;

  // curly braces for named parameters
  // need to initial because member is final
  AppState({
    this.recurrs = const [],
    this.sync = const SyncState(),
  });

  /*
    State Persistence
    (Whenever a new state is added, the below methods needs to be updated)
    Refer: https://github.com/Cretezy/redux_persist/tree/master/packages/redux_persist
   */
  AppState copyWith({List<Recurr> recurrs}) =>
      AppState(recurrs: recurrs ?? this.recurrs);

  static AppState fromJson(dynamic json) {
    print("JSON: ${json["recurrs"].runtimeType}");

    if (json == null) {
      return AppState();
    } else if (json['recurrs'].length == 0) {
      return AppState();
    }

    List<dynamic> jsonRecurs = json["recurrs"];
    List<Recurr> recurrs = jsonRecurs.map((recurrJson) => Recurr.fromJson(recurrJson)).toList();

    return AppState(
        recurrs: recurrs,
    );
  }

  dynamic toJson() =>
      {"recurrs": recurrs.map((recur) => recur.toJson()).toList()};
}
