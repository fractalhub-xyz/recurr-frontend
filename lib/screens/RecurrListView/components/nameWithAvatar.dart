import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recurr_fe/constants.dart';

class NameWithAvatar extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String imageUrl, name;

  NameWithAvatar() {
    var user = _auth.currentUser;
    name = user.displayName;
    imageUrl = user.photoURL;

    if (name.contains(" ")) {
      name = name.substring(0, name.indexOf(" "));
    }
  }

  @override
  Widget build(BuildContext context) {
    final double fs = 14.0;
    return Container(
      padding: EdgeInsets.only(
          left: EdgePadding, right: EdgePadding, top: EdgePadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Hello $name!',
            style: TextStyle(
                fontSize: fs,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600),
          ),
          Spacer(),
          CircleAvatar(
            backgroundImage: NetworkImage(
              imageUrl,
            ),
            radius: fs,
            backgroundColor: Colors.transparent,
          ),
        ],
      ),
    );
  }
}