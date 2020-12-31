import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationTestPage extends StatefulWidget {
  @override
  _NotificationTestPageState createState() => _NotificationTestPageState();
}

class _NotificationTestPageState extends State<NotificationTestPage> {
  FlutterLocalNotificationsPlugin fltrNotification;

  Future notificationSelected(String payload) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('SUP'),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    var androidInit = new AndroidInitializationSettings('molecule');
    var iOSInit = new IOSInitializationSettings();
    var initSettings = new InitializationSettings(androidInit, iOSInit);
    fltrNotification = new FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(initSettings,
        onSelectNotification: notificationSelected);
  }

  _getNotification() async {
    var androidDetails = AndroidNotificationDetails(
        "0", "channelName", "channelDescription",
        importance: Importance.Max);
    var iosDetails = IOSNotificationDetails();
    var notificationDetails = NotificationDetails(androidDetails, iosDetails);

    await fltrNotification.show(0, "title", "body", notificationDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            RaisedButton.icon(
              onPressed: _getNotification,
              icon: Icon(Icons.notification_important),
              label: Text('Raise notification'),
            )
          ],
        ),
      ),
    );
  }
}
