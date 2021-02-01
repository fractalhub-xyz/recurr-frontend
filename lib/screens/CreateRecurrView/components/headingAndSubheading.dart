import 'package:flutter/cupertino.dart';

class HeadingAndSubHeading extends StatelessWidget {
  const HeadingAndSubHeading({
    Key key,
    this.heading,
    this.sub,
  }) : super(key: key);

  final String heading;
  final String sub;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 7),
        Text(
          sub,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
