import 'package:flutter/material.dart';
import 'package:recurr_fe/utils/notifications/notifications.dart';

class UserDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('Show notif'),
          onPressed: () {
            LocalNotification notification = LocalNotification(context);
            notification.setNotificationatTime();
          },
        ),
      ),
    );
  }
}
