import 'package:flutter/material.dart';

import '../../../constants.dart';

class ScoreAndStreakCard extends StatelessWidget {
  const ScoreAndStreakCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      padding: EdgeInsets.all(EdgePadding),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'SCORE',
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
              ),
              Text(
                '1234',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'STREAK',
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
              ),
              Row(
                children: [
                  Text(
                    '5',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                  ),
                  Icon(
                    Icons.hourglass_bottom,
                    size: 18,
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
