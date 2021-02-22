import 'package:flutter/material.dart';
import 'package:recurr_fe/models/recurr.dart';
import 'package:recurr_fe/screens/RecurrDetailView/components/dataPoint.dart';

import '../../../constants.dart';

class Overview extends StatelessWidget {
  const Overview({
    Key key,
    @required this.recurr,
  }) : super(key: key);

  final Recurr recurr;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(EdgePadding * 1.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.grey[200],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DataPoint(
                title: 'Current Streak',
                icon: Icons.local_fire_department,
                data: '${recurr.getStreak()} days',
              ),
              SizedBox(height: 26),
              DataPoint(
                title: 'Total Days',
                icon: Icons.polymer,
                data: '${recurr.getStreak()} days',
              ),
              SizedBox(height: 26),
              DataPoint(
                title: 'Repeats on',
                icon: Icons.polymer,
                data: '${recurr.getRepeatString()}',
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DataPoint(
                title: 'Max Streak',
                icon: Icons.stars,
                data: '${recurr.getStreak()} days',
              ),
              SizedBox(height: 26),
              DataPoint(
                title: 'Created on',
                icon: Icons.calendar_today,
                data: '${recurr.createdAt.substring(0, 10)}',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
