import 'package:flutter/material.dart';

import '../../../constants.dart';

class Quote extends StatelessWidget {
  const Quote({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: EdgePadding, right: EdgePadding, top: EdgePadding),
      child: Text(
        'If you cannot do great things do small things in a great way',
        style: TextStyle(
          fontSize: fs2,
          fontWeight: FontWeight.w200,
        ),
      ),
    );
  }
}
