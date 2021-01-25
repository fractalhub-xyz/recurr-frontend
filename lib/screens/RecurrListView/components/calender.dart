import 'package:flutter/material.dart';
import 'package:recurr_fe/screens/RecurrListView/components/dateCard.dart';

import '../../../constants.dart';

class Calender extends StatelessWidget {
  const Calender({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding:
            EdgeInsets.only(top: EdgePadding * 0.7, bottom: EdgePadding * 2),
        child: Row(children: [
          DateCard(date: '7'),
          DateCard(date: '7'),
          DateCard(date: '7'),
          DateCard(date: '7'),
          DateCard(date: '7'),
          DateCard(date: '7'),
          DateCard(date: '7'),
          DateCard(date: '7'),
          DateCard(date: '7'),
          DateCard(date: '7'),
          DateCard(date: '7'),
          DateCard(date: '7'),
        ]),
      ),
    );
  }
}
