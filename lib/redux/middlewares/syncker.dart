import 'package:recurr_fe/redux/actions/sync_actions.dart';
import 'package:redux/redux.dart';
import '../state/app_state.dart';
import 'package:cloud_functions/cloud_functions.dart';

final syncableActions = List.unmodifiable([
  "ADD_RECURR",
  "UDPATE_RECURR",
  "DELETE_RECURR",
]);

Future<HttpsCallableResult> firebaseDispatch(List actions) {
  HttpsCallable callable = FirebaseFunctions.instance.httpsCallable('dispatch');
  return callable.call(actions).timeout(Duration(seconds: 5));
}

void syncMiddleware(
    Store<AppState> store, dynamic action, NextDispatcher next) async {
  // Give priority to finishing the current action first
  next(action);

  if (!syncableActions.contains(action?.type())) {
    return;
  }

  List dispatchAction = [action?.type(), action?.payload()];

  store.dispatch(SetIsSyncingAction(true));
  try {
    await firebaseDispatch([dispatchAction]);
    print("Firebase sync completed");
  } catch (err) {
    print("Error ${err.runtimeType}");
    store.dispatch(AddToRetryQueueAction(dispatchAction));
  } finally {
    store.dispatch(SetIsSyncingAction(false));
  }
}

void retryMiddleware(
    Store<AppState> store, dynamic action, NextDispatcher next) async {
  next(action);

  if (!(action is SetConnectivityAction &&
      action.newState == true &&
      store.state.sync.retry.length > 0)) {
    return;
  }

  store.dispatch(SetIsSyncingAction(true));
  try {
    List retryQueue = List.from(store.state.sync.retry);
    await firebaseDispatch(retryQueue);
    store.dispatch(ClearRetryQueueAction());
  } catch (err) {
    print("Error happened while trying to sync queue");
  } finally {
    store.dispatch(SetIsSyncingAction(false));
  }
}
