import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class ScoreAndStreakCard extends StatelessWidget {
  const ScoreAndStreakCard({
    Key key,
    this.streak,
  }) : super(key: key);
  final int streak;

  Widget streakIcon() {
    var flag = false;
    if (flag) {
      return SvgPicture.asset("assets/icons/fire.svg", height: fs1);
    } else {
      return SvgPicture.asset("assets/icons/hourglass.svg", height: fs1 - 2);
    }
  }

  final double fs1 = 18;

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
          ConditionallyShowStreak(streak, fs1),
        ],
      ),
    );
  }
}

class ConditionallyShowStreak extends StatelessWidget {
  final int streak;
  final double fs1;

  ConditionallyShowStreak(this.streak, this.fs1);

  @override
  Widget build(BuildContext context) {
    if (streak == 0) {
      return Text("");
    }

    return Row(
      children: [
        Text(
          streak.toString(),
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: fs1,
          ),
        ),
        SvgPicture.asset("assets/icons/fire.svg", height: fs1)
      ],
    );
  }
}
