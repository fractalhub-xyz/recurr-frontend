import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recurr_fe/models/recurr.dart';
import 'package:recurr_fe/screens/CheckinView/CheckinView.dart';

import '../../../constants.dart';

class CheckinCard extends StatefulWidget {
  CheckinCard({
    Key key,
    this.recurr,
    this.checkall,
    this.onCheckRecur,
  }) : super(key: key);

  final Recurr recurr;
  final bool checkall;
  final CheckinCallback onCheckRecur;

  @override
  _CheckinCardState createState() => _CheckinCardState();
}

class _CheckinCardState extends State<CheckinCard> {
  _CheckinCardState();

  String repeatString = '';
  bool checked = false;
  Recurr recurr;

  @override
  void initState() {
    super.initState();
    recurr = widget.recurr;
  }

  Color baseColor = Colors.grey[200];

  final double fs1 = 16.0;
  final double fs2 = 12.0;


  setbg() {
    if (checked) {
      baseColor = Colors.blueGrey[100];
    } else {
      baseColor = Colors.grey[200];
    }
  }

  void onCheck(bool isChecked) {
    setState(() {
      checked = isChecked;
      setbg();
      widget.onCheckRecur(recurr.id, isChecked);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onCheck(!checked);
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: EdgePadding, vertical: EdgePadding * 0.3),
        decoration: BoxDecoration(
          color: baseColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Container(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
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
                    ],
                  ),
                  SizedBox(height: 3),
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.group,
                            size: 18,
                          ),
                          SizedBox(width: 4),
                          Text(
                            recurr.team,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Poppins',
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: 15),
                      Text(
                        '0/${recurr.duration}',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Spacer(),
              Checkbox(
                  value: widget.checkall || checked,
                  onChanged: (value) {
                    onCheck(value);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
