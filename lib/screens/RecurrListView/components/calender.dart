import 'package:flutter/material.dart';
import 'package:recurr_fe/screens/RecurrListView/components/dateCard.dart';

import '../../../constants.dart';

class Calender extends StatelessWidget {
  Calender({
    Key key,
    this.setDate,
    this.selectedDate,
  }) : super(key: key);

  final Function setDate;
  final DateTime date = DateTime.now();
  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding:
            EdgeInsets.only(top: EdgePadding * 0.7, bottom: EdgePadding * 2),
        child: Row(children: [
          DateCard(
              date: date.subtract(Duration(hours: 24) * 13),
              setDate: setDate,
              seletedDate: selectedDate),
          DateCard(
              date: date.subtract(Duration(hours: 24) * 12),
              setDate: setDate,
              seletedDate: selectedDate),
          DateCard(
              date: date.subtract(Duration(hours: 24) * 11),
              setDate: setDate,
              seletedDate: selectedDate),
          DateCard(
              date: date.subtract(Duration(hours: 24) * 10),
              setDate: setDate,
              seletedDate: selectedDate),
          DateCard(
              date: date.subtract(Duration(hours: 24) * 9),
              setDate: setDate,
              seletedDate: selectedDate),
          DateCard(
              date: date.subtract(Duration(hours: 24) * 8),
              setDate: setDate,
              seletedDate: selectedDate),
          DateCard(
              date: date.subtract(Duration(hours: 24) * 7),
              setDate: setDate,
              seletedDate: selectedDate),
          DateCard(
              date: date.subtract(Duration(hours: 24) * 6),
              setDate: setDate,
              seletedDate: selectedDate),
          DateCard(
              date: date.subtract(Duration(hours: 24) * 5),
              setDate: setDate,
              seletedDate: selectedDate),
          DateCard(
              date: date.subtract(Duration(hours: 24) * 4),
              setDate: setDate,
              seletedDate: selectedDate),
          DateCard(
              date: date.subtract(Duration(hours: 24) * 3),
              setDate: setDate,
              seletedDate: selectedDate),
          DateCard(
              date: date.subtract(Duration(hours: 24) * 2),
              setDate: setDate,
              seletedDate: selectedDate),
          DateCard(
              date: date.subtract(Duration(hours: 24)),
              setDate: setDate,
              seletedDate: selectedDate),
          DateCard(date: date, setDate: setDate, seletedDate: selectedDate),
        ]),
      ),
    );
  }
}
