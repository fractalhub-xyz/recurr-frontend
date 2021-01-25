import 'package:flutter/material.dart';

import '../../../constants.dart';

class RepeatDaysAndGroup extends StatelessWidget {
  const RepeatDaysAndGroup({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(EdgePadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Repeat on ',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
              ),
              Text(
                'Mon Tue Wed Thur Fri',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
              ),
            ],
          ),
          Spacer(),
          Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.group,
                    size: 18,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Group',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
