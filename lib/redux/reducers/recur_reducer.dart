import 'package:recurr_fe/models/recurr.dart';
import 'package:recurr_fe/redux/actions/recurr_actions.dart';
import 'package:recurr_fe/redux/state/recurr_state.dart';
import 'package:redux/redux.dart';

Reducer<RecurrState> recurrsReducer = combineReducers([
  TypedReducer<RecurrState, AddRecurrAction>(_addRecurr),
  TypedReducer<RecurrState, UpdateRecurrAction>(_updateRecurr),
  TypedReducer<RecurrState, DeleteRecurrAction>(_deleteRecurr),
  TypedReducer<RecurrState, CheckInAction>(_checkInRecur),
]);

RecurrState _addRecurr(RecurrState recurrs, AddRecurrAction action) {
  var newRecurrs = List<Recurr>.from(recurrs.recurrList)..add(action.item);
  return recurrs.copyWith(recurrs: newRecurrs);
}

RecurrState _deleteRecurr(RecurrState recurrs, DeleteRecurrAction action) {
  var newRecurrs =
      recurrs.recurrList.where((recurr) => recurr.id != action.id).toList();
  return recurrs.copyWith(recurrs: newRecurrs);
}

RecurrState _updateRecurr(RecurrState recurrs, UpdateRecurrAction action) {
  var newRecurrs = recurrs.recurrList
      .map((recurr) => recurr.id == action.id ? action.item : recurr)
      .toList();
  return recurrs.copyWith(recurrs: newRecurrs);
}

RecurrState _checkInRecur(RecurrState recurrs, CheckInAction action) {
  var timestamp = DateTime.now();

  var newRecurrs = recurrs.recurrList.map((rcr) {
    if (action.recurIds.contains(rcr.id)) {
      if (!rcr.isCheckedInToday()) {
        rcr.addNewCheckin(timestamp);
      }
    }
    return rcr;
  }).toList();

  return recurrs.copyWith(recurrs: newRecurrs);
}
