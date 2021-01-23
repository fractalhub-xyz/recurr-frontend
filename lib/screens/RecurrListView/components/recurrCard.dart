import 'package:flutter/material.dart';
import 'package:recurr_fe/models/recurr.dart';
import 'package:recurr_fe/screens/RecurrDetailView/RecurrDetailView.dart';

import '../../../constants.dart';
import 'labelledIcon.dart';

class RecurrCard extends StatelessWidget {
  RecurrCard({
    Key key,
    this.recurr,
  }) : super(key: key);

  final Recurr recurr;

  final Color baseColor = Colors.grey[200];
  final Color splashColor = Colors.grey[300];
  final double borderRadius = 7.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: EdgePadding, vertical: EdgePadding * 0.3),
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecurrDetailView(recurr: recurr),
              ),
            );
          },
          borderRadius: BorderRadius.circular(borderRadius),
          splashColor: splashColor,
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      recurr.title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 20),
                    LabelledIcon(label: '7', icon: Icons.local_fire_department),
                    Spacer(),
                    LabelledIcon(label: 'Group', icon: Icons.group),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text('Weekdays'),
                    Spacer(),
                    Text('0/${recurr.duration}')
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
