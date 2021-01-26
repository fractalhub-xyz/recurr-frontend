import 'package:flutter/material.dart';
import 'package:recurr_fe/constants.dart';

class DateAndCheckallBtn extends StatelessWidget {
  DateAndCheckallBtn({
    Key key,
    @required this.checkall,
    this.setCheckAll,
  }) : super(key: key);

  final DateTime now = DateTime.now();
  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December	',
  ];
  final bool checkall;
  final Function setCheckAll;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: EdgePadding),
            child: Text(
              '${now.day} ${months[now.month]}, ${now.year}',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Spacer(),
          Row(
            children: [
              Text(
                'Check all',
                style: TextStyle(fontFamily: 'Poppins'),
              ),
              Checkbox(value: checkall, onChanged: setCheckAll),
            ],
          )
        ],
      ),
    );
  }
}
