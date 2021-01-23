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
    return Container(
        padding: EdgeInsets.only(
            left: EdgePadding, right: EdgePadding, top: EdgePadding),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: fs3,
                fontWeight: FontWeight.w700,
              ),
            ),
            Spacer(),
            FlatButton.icon(
                color: Colors.grey[200],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                onPressed: press,
                icon: Icon(icon),
                label: Text(iconlabel))
          ],
        ));
  }
}
