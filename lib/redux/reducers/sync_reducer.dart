
import 'package:recurr_fe/redux/actions/sync_actions.dart';
import 'package:recurr_fe/redux/syncState.dart';
import 'package:redux/redux.dart';

Reducer<SyncState> syncReducer = combineReducers([
  TypedReducer<SyncState, SetConnectivityAction>(_setConnectivity),
  TypedReducer<SyncState, SetIsSyncingAction>(_setIsSyncing),
  TypedReducer<SyncState, AddToRetryQueueAction>(_addToRetryQueue),
  TypedReducer<SyncState, ClearRetryQueueAction>(_clearRetryQueue),
]);


SyncState _setConnectivity(SyncState sync, SetConnectivityAction action) {
  return sync.copyWith(connectivity: action.newState);
}

SyncState _setIsSyncing(SyncState sync, SetIsSyncingAction action) {
  return sync.copyWith(isSyncing: action.newState);
}

SyncState _addToRetryQueue(SyncState sync, AddToRetryQueueAction action) {
  List retryQueue = List.from(sync.retry);
  retryQueue.add(action.action);
  return sync.copyWith(retry: retryQueue);
}

SyncState _clearRetryQueue(SyncState sync, ClearRetryQueueAction action) {
  List retryQueue = List.from(sync.retry);
  retryQueue.clear();
  return sync.copyWith(retry: retryQueue);
}