
import 'package:recurr_fe/redux/actions/connectivity_actions.dart';

bool connectivityReducer(bool currentState, dynamic action) {
  if (action is SetConnectivityAction) {
    return action.newState;
  }
  return currentState;
}