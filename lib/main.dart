import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:recurr_fe/pages/AddRecurView.dart';
import 'package:recurr_fe/LocalNotifications.dart';
import 'package:recurr_fe/pages/LoginView.dart';
import 'package:recurr_fe/pages/RecurListView.dart';
import 'package:recurr_fe/redux/appState.dart';
import 'package:recurr_fe/redux/store.dart';
import 'package:redux/redux.dart';

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
        child: new MaterialApp(
          title: 'Flutter Login',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/login',
          routes: {
            '/login': (context) => LoginPage(),
            '/recur/create': (context) => CreateRecurView(),
            '/recur/list': (context) => RecurListView(),
            'notification': (context) => NotificationTestPage(),
          },
        ));
  }
}
