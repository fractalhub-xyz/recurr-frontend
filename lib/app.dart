import 'package:flutter/material.dart';
import 'package:recurr_fe/LocalNotifications.dart';
import 'package:recurr_fe/screens/CheckinView/CheckinView.dart';
import 'package:recurr_fe/screens/CreateRecurrView/CreateRecurrView.dart';
import 'package:recurr_fe/screens/Home/HomeView.dart';
import 'package:recurr_fe/screens/Login/LoginView.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginView(),
        '/': (context) => HomeView(),
        '/recur/create': (context) => CreateRecurView(),
        '/recur/checkin': (context) => CheckinView(),
        'notification': (context) => NotificationTestPage(),
      },
    );
  }
}
