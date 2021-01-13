import 'package:flutter/material.dart';
import 'package:recurr_fe/LocalNotifications.dart';
import 'package:recurr_fe/RecurListView.dart';
import 'package:recurr_fe/addrecur.dart';
import 'package:recurr_fe/firstscreen.dart';
import 'package:recurr_fe/loginpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/': (context) => FirstScreen(),
        '/recur/create': (context) => CreateRecurView(),
        '/recur/list': (context) => RecurListView(),
        'notification': (context) => NotificationTestPage(),
      },
    );
  }
}
