import 'package:recurr_fe/redux/appState.dart';
import 'package:recurr_fe/redux/reducers/recur_reducer.dart';

AppState rootReducer(AppState state, dynamic action) => new AppState(
      recurrs: recurrsReducer(state.recurrs, action),
    );
