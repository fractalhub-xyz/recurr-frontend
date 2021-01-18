import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:recurr_fe/pages/AddRecurrView.dart';
import 'package:recurr_fe/LocalNotifications.dart';
import 'package:recurr_fe/pages/LoginView.dart';
import 'package:recurr_fe/pages/RecurrListView.dart';
import 'package:recurr_fe/redux/appState.dart';
import 'package:recurr_fe/redux/store.dart';
import 'package:redux/redux.dart';
import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart';

void main() async {
  Store<AppState> store = await getStore();

  runApp(MyApp(store));
}

class MyApp extends StatefulWidget {
  final Store<AppState> store;

  MyApp(this.store);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Connectivity _connectivity = Connectivity();

  @override
  void initState() {
    super.initState();
    _connectivity.onConnectivityChanged.listen((event) {
      Future<bool> hasConnection = checkConnection();
      print(event.toString());
      hasConnection.then((value) => print(value));
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
    return new StoreProvider(
        store: widget.store,
        child: new MaterialApp(
          title: 'Flutter Login',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/login',
          routes: {
            '/login': (context) => LoginPage(),
            '/recur/create': (context) => CreateRecurView(),
            '/recur/list': (context) => RecurrListView(),
            'notification': (context) => NotificationTestPage(),
          },
        ));
  }
}
