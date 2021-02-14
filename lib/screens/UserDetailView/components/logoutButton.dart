import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogoutButton extends StatefulWidget {
  const LogoutButton({
    Key key,
  }) : super(key: key);

  @override
  _LogoutButtonState createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Center(
        child: ButtonTheme(
          minWidth: 300,
          height: 40,
          child: OutlineButton(
            borderSide: BorderSide(
              color: Colors.amber,
              style: BorderStyle.solid,
              width: 1.8,
            ),
            child: Text('Log out'),
            onPressed: () async {
              await _signOut();
              Navigator.popUntil(context, ModalRoute.withName('/'));
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ),
      ),
    );
  }
}
