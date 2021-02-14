import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    Key key,
    this.text,
    this.press,
    this.icon,
  }) : super(key: key);

  final String text;
  final Function press;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Icon(
              icon,
              size: 30,
            ),
            SizedBox(width: 10),
            Text(text,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins')),
            Spacer(),
            Icon(Icons.arrow_forward)
          ],
        ),
      ),
    );
  }
}
