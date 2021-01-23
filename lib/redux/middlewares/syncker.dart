import 'package:redux/redux.dart';
import '../appState.dart';
import 'package:cloud_functions/cloud_functions.dart';

final syncableActions = List.unmodifiable([
  "ADD_RECURR",
  "UDPATE_RECURR",
  "DELETE_RECURR",
]);


Future<HttpsCallableResult> firebaseDispatch(List actions){
 HttpsCallable callable = FirebaseFunctions.instance.httpsCallable('dispatch');
 return callable.call(actions).timeout(Duration(seconds: 5));
}

void synckerMiddleware(
    Store<AppState> store, dynamic action, NextDispatcher next) {
  var actionType = action?.type();

  if (syncableActions.contains(actionType)) {
    var actionPayload = action?.payload();
    var actions = [[actionType, actionPayload]];
    print('===> Syncing $actions');

    firebaseDispatch(actions).then((result) {
      print("Done $result");
    }).catchError((err) {
      // TODO: Push to sync retry queue
      print("Error ${err}");
    });
  }

  // TODO: check if it is connectivity action with value true
  // TODO: in that case, fetch all retry actions and try

  next(action);
}
