import 'package:flutter/material.dart';

import '../../../constants.dart';

class Log extends StatelessWidget {
  const Log({
    Key key,
    @required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: EdgePadding),
      height: height * 0.4,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(borderRadius)),
    );
  }
}
