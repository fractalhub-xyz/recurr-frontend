import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recurr_fe/utils/notifications/notifications.dart';

class NotificationTimePicker extends StatelessWidget {
  NotificationTimePicker({this.time, this.setTime});
  final Function setTime;
  final DateTime time;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: false,
          title: Text(
            'Pick a time',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.75,
              width: double.infinity,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                initialDateTime: DateTime(1969, 1, 1, time.hour, time.minute),
                onDateTimeChanged: (DateTime newDateTime) {
                  setTime(newDateTime);
                },
                use24hFormat: false,
                minuteInterval: 1,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: FlatButton.icon(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  color: Colors.amber,
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  onPressed: () {
                    LocalNotification notification = LocalNotification(context);
                    notification.setNotificationatTime(
                        time.hour, time.minute, time.second);
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.add_alert),
                  label: Text('Set Time')),
            )
          ],
        ));
  }
}
