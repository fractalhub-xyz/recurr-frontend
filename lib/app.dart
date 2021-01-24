import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recurr_fe/LocalNotifications.dart';
import 'package:recurr_fe/screens/CheckinView/CheckinView.dart';
import 'package:recurr_fe/screens/CreateRecurrView/CreateRecurrView.dart';
import 'package:recurr_fe/screens/Home/HomeView.dart';
import 'package:recurr_fe/screens/Login/LoginView.dart';

class App extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String getLandingRoute() {
    var user = _auth.currentUser;
    return user != null ? "/" : "/login";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: getLandingRoute(),
      routes: {
        '/login': (context) => LoginView(),
        '/': (context) => HomeView(),
        '/recurr/create': (context) => CreateRecurView(),
        '/recurr/checkin': (context) => CheckinView(),
        'notification': (context) => NotificationTestPage(),
      },
    );
  }
}
