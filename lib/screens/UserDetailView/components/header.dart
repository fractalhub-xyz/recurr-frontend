import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String imageUrl, name, email;

  Header() {
    var user = _auth.currentUser;
    name = user.displayName;
    imageUrl = user.photoURL;
    email = user.email;

    if (name.contains(" ")) {
      name = name.substring(0, name.indexOf(" "));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
            imageUrl,
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
              name,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins'),
            ),
            SizedBox(height: 3),
            Text(
              email,
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
