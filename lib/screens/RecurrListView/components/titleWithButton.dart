import 'package:flutter/material.dart';

import '../../../constants.dart';

class TitleWithButton extends StatelessWidget {
  const TitleWithButton({
    Key key,
    this.icon,
    this.label,
    this.press,
    this.iconlabel,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final String iconlabel;
  final Function press;

  @override
  Widget build(BuildContext context) {
    final double fs1 = 14;
    final double fs2 = 12;
    return Container(
        padding: EdgeInsets.only(
            left: EdgePadding, right: EdgePadding, top: EdgePadding),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: fs1,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
            ),
            Spacer(),
            FlatButton.icon(
              color: Colors.grey[200],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              onPressed: press,
              icon: Icon(icon, size: fs2),
              label: Text(
                iconlabel,
                style: TextStyle(fontFamily: 'Poppins', fontSize: fs2),
              ),
            )
          ],
        ));
  }
}
