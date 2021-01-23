import 'package:recurr_fe/redux/state/app_state.dart';
import 'package:redux/redux.dart';

void loggerMiddleware(Store<AppState> store, action, NextDispatcher next) {
  print(
      "[${DateTime.now().toLocal()}] ACTION: ${action?.type()} || PAYLOAD: ${action?.payload()}");
  next(action);
}
