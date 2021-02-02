import 'package:flutter/material.dart';

import '../../../constants.dart';

class DateCard extends StatelessWidget {
  DateCard({
    Key key,
    this.date,
    this.setDate,
    this.seletedDate,
  }) : super(key: key);
  final DateTime date;
  final Function setDate;
  final DateTime seletedDate;
  final List<String> day = ['Mon', 'Tue', 'Wed', 'Thr', 'Fri', 'Sat', 'Sun'];

  Color getColor() {
    if (seletedDate.day == date.day) {
      return Colors.blueGrey[700];
    } else {
      return Colors.transparent;
    }
  }

  Color getFontColor() {
    if (seletedDate.day == date.day) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setDate(date);
      },
      child: Container(
          margin: EdgeInsets.only(left: EdgePadding * 0.9),
          height: 60,
          width: 45,
          decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: Colors.blueGrey[900]),
            color: getColor(),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('${day[date.weekday - 1]}',
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      color: getFontColor())),
              SizedBox(height: 10),
              Text(
                '${date.day}',
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    color: getFontColor()),
              ),
            ],
          )),
    );
  }
}
