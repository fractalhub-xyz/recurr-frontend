import 'package:recurr_fe/models/recurr.dart';

class AddRecurrAction {
  final Recurr item;

  AddRecurrAction({this.item});

  // These two methods are required for logging and sending to backend
  String type() => "ADD_RECURR";
  Map payload() => item.toJson();
}

class UpdateRecurrAction {
  final String id;
  final Recurr item;

  UpdateRecurrAction({this.id, this.item});

  String type() => "UPDATE_RECURR";
  Map payload() => {"id": id, "item": item.toJson()};
}

class DeleteRecurrAction {
  final String id;

  DeleteRecurrAction({this.id});

  String type() => "DELETE_RECURR";
  Map payload() => {"id": id};
}

class CheckInAction {
  final List<String> recurIds;

  CheckInAction({ this.recurIds });

  String type() => "CHECKIN_RECUR";
  Map payload() => {"recur_ids": recurIds.join(" ")};
}