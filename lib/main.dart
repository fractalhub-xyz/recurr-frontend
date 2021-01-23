import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:recurr_fe/app.dart';
import 'package:recurr_fe/redux/actions/sync_actions.dart';
import 'package:recurr_fe/redux/state/app_state.dart';
import 'package:recurr_fe/redux/store.dart';
import 'package:redux/redux.dart';
import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart';

void main() async {
  Store<AppState> store = await getStore();

  runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp(this.store);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
      store: store,
      child: _AppWithConnection(),
    );
  }
}

class _AppWithConnection extends StatefulWidget {
  @override
  __AppWithConnectionState createState() => __AppWithConnectionState();
}

// Wraps the main App class with connection checkin logic
class __AppWithConnectionState extends State<_AppWithConnection> {
  final Connectivity _connectivity = Connectivity();

  @override
  void initState() {
    super.initState();
    _connectivity.onConnectivityChanged.listen((event) {
      Future<bool> hasConnection = checkConnection();
      print(event.toString());
      hasConnection.then((bool value) {
        print("Connectivity updated: $value");
        StoreProvider.of<AppState>(context)
            .dispatch(SetConnectivityAction(value));
      });
    });
  }

  //The test to actually see if there is a connection
  Future<bool> checkConnection() async {
    bool hasConnection;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
      } else {
        hasConnection = false;
      }
    } on SocketException catch (_) {
      hasConnection = false;
    }
    return hasConnection;
  }

  @override
  Widget build(BuildContext context) {
    return App();
  }
}