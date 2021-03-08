import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String getImageURL() => _auth.currentUser.photoURL;
  String getName() => _auth.currentUser.displayName;
  String getEmail() => _auth.currentUser.email;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
            getImageURL(),
          ),
          radius: 32,
          backgroundColor: Colors.transparent,
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              getName(),
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins'),
            ),
            SizedBox(height: 3),
            Text(
              getEmail(),
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Poppins'),
            ),
          ],
        )
      ],
    );
  }
}
