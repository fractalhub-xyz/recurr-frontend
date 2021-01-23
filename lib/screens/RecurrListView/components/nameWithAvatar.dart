import 'package:flutter/material.dart';
import 'package:recurr_fe/constants.dart';
import 'package:recurr_fe/screens/Login/sign_in.dart';

class NameWithAvatar extends StatelessWidget {
  const NameWithAvatar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: EdgePadding, right: EdgePadding, top: EdgePadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Hello $name!',
            style: TextStyle(fontSize: fs1),
          ),
          Spacer(),
          CircleAvatar(
            backgroundImage: NetworkImage(
              imageUrl,
            ),
            radius: fs1,
            backgroundColor: Colors.transparent,
          ),
        ],
      ),
    );
  }
}
