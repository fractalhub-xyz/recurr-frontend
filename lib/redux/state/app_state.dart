import 'package:recurr_fe/models/recurr.dart';
import 'package:recurr_fe/redux/state/recurr_state.dart';
import 'package:recurr_fe/redux/state/sync_state.dart';

class AppState {
  final RecurrState recurrs;
  final SyncState sync;

  AppState({
    this.recurrs = const RecurrState(),
    this.sync = const SyncState(),
  });

  /*
    State Persistence
    (Whenever a new state is added, the below methods needs to be updated)
    Refer: https://github.com/Cretezy/redux_persist/tree/master/packages/redux_persist
   */
  AppState copyWith({RecurrState recurrs, SyncState sync}) =>
      AppState(recurrs: recurrs ?? this.recurrs, sync: sync ?? this.sync);

  static AppState fromJson(dynamic json) {
    if (json == null) {
      return AppState();
    }

    return AppState(
      recurrs: RecurrState.fromJson(json),
      sync: SyncState.fromJson(json),
    );
  }

  dynamic toJson() => {
        "recurrs": recurrs.toJson(),
        "sync": sync.toJson(),
      };
}
