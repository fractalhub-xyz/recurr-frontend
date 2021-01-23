import 'package:recurr_fe/redux/state/app_state.dart';
import 'package:recurr_fe/redux/reducers/recur_reducer.dart';
import 'package:recurr_fe/redux/reducers/sync_reducer.dart';

AppState rootReducer(AppState state, dynamic action) => new AppState(
    recurrs: recurrsReducer(state.recurrs, action),
    sync: syncReducer(state.sync, action));
