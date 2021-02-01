import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          actions: [
            IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.black,
                ),
                onPressed: () {
                  print('implement edit');
                })
          ],
        ),
        body: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.time,
          initialDateTime: DateTime(1969, 1, 1, time.hour, time.minute),
          onDateTimeChanged: (DateTime newDateTime) {
            setTime(newDateTime);
          },
          use24hFormat: false,
          minuteInterval: 1,
        ));
  }
}
