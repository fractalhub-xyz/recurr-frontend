import 'package:recurr_fe/models/recurr.dart';
import 'package:recurr_fe/redux/actions/recurr_actions.dart';
import 'package:redux/redux.dart';

Reducer<List<Recurr>> recurrsReducer = combineReducers([
  TypedReducer<List<Recurr>, AddRecurrAction>(_addRecurr),
  TypedReducer<List<Recurr>, UpdateRecurrAction>(_updateRecurr),
  TypedReducer<List<Recurr>, DeleteRecurrAction>(_deleteRecurr),
  // TODO: Implement check in recurr (multiple)
]);

List<Recurr> _addRecurr(List<Recurr> recurrs, AddRecurrAction action) {
  return List.from(recurrs)..add(action.item);
}

List<Recurr> _deleteRecurr(List<Recurr> recurrs, DeleteRecurrAction action) {
  return recurrs.where((recurr) => recurr.id != action.id).toList();
}

List<Recurr> _updateRecurr(List<Recurr> recurrs, UpdateRecurrAction action) {
  return recurrs
      .map((recurr) => recurr.id == action.id ? action.item : recurr)
      .toList();
}
