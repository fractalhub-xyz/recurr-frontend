import 'package:firebase_auth/firebase_auth.dart';
import 'package:recurr_fe/models/checkin.dart';
import 'package:recurr_fe/models/recurr.dart';
import 'package:recurr_fe/redux/actions/recurr_actions.dart';
import 'package:redux/redux.dart';

Reducer<List<Recurr>> recurrsReducer = combineReducers([
  TypedReducer<List<Recurr>, AddRecurrAction>(_addRecurr),
  TypedReducer<List<Recurr>, UpdateRecurrAction>(_updateRecurr),
  TypedReducer<List<Recurr>, DeleteRecurrAction>(_deleteRecurr),
  TypedReducer<List<Recurr>, CheckInAction>(_checkInRecur),
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

List<Recurr> _checkInRecur(List<Recurr> recurrs, CheckInAction action) {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var currentCheckin = Checkin(
    user: _auth.currentUser.uid,
    timestamp: DateTime.now(),
  );

  return recurrs.map((rcr) {
    if (action.recurIds.contains(rcr.id)) {
      if (!rcr.isCheckedInToday()) {
        rcr.checkins.add(currentCheckin);
      }
    }
  }).toList();
}
