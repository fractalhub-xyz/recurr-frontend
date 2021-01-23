class SetConnectivityAction {
  final bool newState;

  SetConnectivityAction(this.newState);

  // For middleware
  String type() => "SET_CONNECTIVITY";
  bool payload() => newState;
}

class SetIsSyncingAction {
  final bool newState;

  SetIsSyncingAction(this.newState);

  // For middleware
  String type() => "SET_IS_SYNCING";
  bool payload() => newState;
}

class AddToRetryQueueAction {
  final List<String> action;

  AddToRetryQueueAction(this.action);

  // For middleware
  String type() => "ADD_TO_RETRY_QUEUE";
  List<String> payload() => action;
}

class ClearRetryQueueAction {
  // For middleware
  String type() => "CLEAR_RETRY_QUEUE";
  String payload() => "";
}