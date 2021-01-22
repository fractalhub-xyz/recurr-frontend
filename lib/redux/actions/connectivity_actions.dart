class SetConnectivityAction {
  final bool newState;

  SetConnectivityAction(this.newState);

  // For backend
  String type() => "SET_CONNECTIVITY";

  bool payload() => newState;
}
