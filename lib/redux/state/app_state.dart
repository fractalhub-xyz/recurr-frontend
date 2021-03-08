import 'package:recurr_fe/models/recurr.dart';
import 'package:recurr_fe/redux/state/recurr_state.dart';
import 'package:recurr_fe/redux/state/sync_state.dart';

class AppState {
  final List<Recurr> recurrs;
  final RecurrState recurrs_;
  final SyncState sync;

  AppState({
    this.recurrs = const [],
    this.sync = const SyncState(),
    this.recurrs_ = const RecurrState(),
  });

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

    List<dynamic> jsonRecurs = json["recurrs"];
    List<Recurr> recurrs =
        jsonRecurs.map((recurrJson) => Recurr.fromJson(recurrJson)).toList();

    return AppState(
      recurrs: recurrs,
      recurrs_: RecurrState.fromJson(json),
      sync: SyncState.fromJson(json),
    );
  }

  dynamic toJson() =>
      {
        "recurrs": recurrs.map((recur) => recur.toJson()).toList(),
        "sync": sync.toJson(),
      };
}
