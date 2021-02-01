import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recurr_fe/screens/UserDetailView/NotificationTimePicker.dart';
import 'package:recurr_fe/utils/notifications/notifications.dart';

class UserDetailView extends StatefulWidget {
  @override
  _UserDetailViewState createState() => _UserDetailViewState();
}

class _UserDetailViewState extends State<UserDetailView> {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  DateTime time = DateTime.now();

  setTime(value) {
    setState(() {
      time = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('Show notif'),
              onPressed: () {
                LocalNotification notification = LocalNotification(context);
                notification.setNotificationatTime();
              },
            ),
            RaisedButton(
              child: Text('Log out'),
              onPressed: () async {
                await _signOut();
                Navigator.popUntil(context, ModalRoute.withName('/'));
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
            RaisedButton(
              child: Text('Show notif'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationTimePicker(
                              time: time,
                              setTime: setTime,
                            )));
              },
            ),
            Text('$time'),
          ],
        ),
      ),
    );
  }
}
