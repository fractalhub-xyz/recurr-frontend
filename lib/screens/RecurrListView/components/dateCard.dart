import 'package:flutter/material.dart';

import '../../../constants.dart';

class DateCard extends StatelessWidget {
  const DateCard({
    Key key,
    this.date,
  }) : super(key: key);
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: EdgePadding * 0.6),
      height: 100,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.blueGrey[300],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(date),
      ),
    );
  }
}
