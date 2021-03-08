import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recurr_fe/constants.dart';

class NameWithAvatar extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String getImageURL() => _auth.currentUser.photoURL;

  String getName() {
    var name = _auth.currentUser.displayName;

    if (name.contains(" ")) {
      name = name.substring(0, name.indexOf(" "));
    }

    return name;
  }

  @override
  Widget build(BuildContext context) {
    final double fs = 20.0;
    return Container(
      padding: EdgeInsets.only(
          left: EdgePadding, right: EdgePadding, top: EdgePadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Hello ${getName()}!',
            style: TextStyle(
                fontSize: fs,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                getImageURL(),
              ),
              radius: fs,
              backgroundColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
