import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotification {
  BuildContext context;
  FlutterLocalNotificationsPlugin _fltrNotification;
  AndroidInitializationSettings _androidInit;
  IOSInitializationSettings _iOSInit;
  InitializationSettings _initSettings;
  LocalNotification(BuildContext context) {
    _androidInit = new AndroidInitializationSettings('molecule');
    _iOSInit = new IOSInitializationSettings();
    _initSettings = new InitializationSettings(_androidInit, _iOSInit);
    _fltrNotification = new FlutterLocalNotificationsPlugin();
    _fltrNotification.initialize(_initSettings,
        onSelectNotification: _notificationSelected);
    this.context = context;
  }

  Future _notificationSelected(String payload) async {
    print('push');
    Navigator.pushNamed(this.context, '/recurr/checkin');
    // showDialog(
    //   context: context,
    //   builder: (context) => AlertDialog(
    //     content: Text('SUP'),
    //   ),
    // );
  }

  setNotificationatTime(hour, minute, second) async {
    var androidDetails = AndroidNotificationDetails(
        "0", "channelName", "channelDescription",
        importance: Importance.Max);
    var iosDetails = IOSNotificationDetails();
    var notificationDetails = NotificationDetails(androidDetails, iosDetails);
    var notificationTime = Time(hour, minute, second);
    print('set');
    await _fltrNotification.showDailyAtTime(
        0, 'title', 'body', notificationTime, notificationDetails);
    // await _fltrNotification.show(0, "title", "body", notificationDetails);
  }

  Future getActiveNotif() async {
    final List<PendingNotificationRequest> pendingNotificationRequests =
        await _fltrNotification.pendingNotificationRequests();
    return pendingNotificationRequests;
  }
}
