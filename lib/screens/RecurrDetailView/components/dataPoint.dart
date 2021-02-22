import 'package:flutter/material.dart';

class DataPoint extends StatelessWidget {
  const DataPoint({
    Key key,
    this.title,
    this.icon,
    this.data,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(icon, size: 19),
            SizedBox(width: 3),
            Text(
              title,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                  fontSize: 14),
            ),
          ],
        ),
        SizedBox(height: 3),
        Text(
          data,
          style: TextStyle(
              fontFamily: 'Poppins', fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ],
    );
  }
}
