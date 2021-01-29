import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recurr_fe/models/recurr.dart';
import 'package:recurr_fe/screens/RecurrDetailView/RecurrDetailView.dart';

import '../../../constants.dart';

class RecurrCard extends StatefulWidget {
  RecurrCard({
    Key key,
    this.recurr,
  }) : super(key: key);

  final Recurr recurr;

  @override
  _RecurrCardState createState() => _RecurrCardState(recurr);
}

class _RecurrCardState extends State<RecurrCard> {
  Recurr recurr;
  _RecurrCardState(this.recurr);
  String repeatString = '';
  @override
  void initState() {
    super.initState();
    // TODO: move this to recur class
    List<String> days = ['Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat', 'Sun'];
    List<bool> boolmap = recurr.repeats;
    boolmap.asMap().forEach((index, value) => {
          if (value == true) {repeatString = repeatString + days[index] + " "}
        });
    var isEveryday = boolmap.every((day) => day);
    if (isEveryday) {
      repeatString = "everyday";
    }
  }

  final Color baseColor = Colors.grey[200];
  final Color splashColor = Colors.grey[300];

  final double fs1 = 16.0;
  final double fs2 = 12.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: EdgePadding, vertical: EdgePadding * 0.3),
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecurrDetailView(recurr: widget.recurr),
              ),
            );
          },
          borderRadius: BorderRadius.circular(borderRadius),
          splashColor: splashColor,
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Title
                    Text(
                      widget.recurr.title,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: fs1,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 5),
                    //Labelled Icons (Streak)
                    Row(
                      children: [
                        Text(
                          '7',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: fs1,
                          ),
                        ),
                        SvgPicture.asset("assets/icons/fire.svg", height: fs1)
                      ],
                    ),
                    Spacer(),
                    //Labelled Icons (Group)
                    Row(
                      children: [
                        Text(
                          recurr.team,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: fs1 * 0.85,
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(Icons.group, size: fs1 * 1.35)
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    //Repeat Days
                    Text(
                      repeatString,
                      style: TextStyle(fontSize: fs2, fontFamily: 'Poppins'),
                    ),
                    Spacer(),
                    Text('0/${widget.recurr.duration}')
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
