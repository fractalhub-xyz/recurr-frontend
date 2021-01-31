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

  Border getBorder() {
    if (seletedDate.day == date.day) {
      return Border.all(width: 3.0, color: Colors.blueGrey[900]);
    } else {
      return Border.all(width: 0);
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
          width: 40,
          decoration: BoxDecoration(
            border: getBorder(),
            color: Colors.blueGrey[300],
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${date.day}',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              Text('${day[date.weekday - 1]}',
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500)),
            ],
          )),
    );
  }
}
