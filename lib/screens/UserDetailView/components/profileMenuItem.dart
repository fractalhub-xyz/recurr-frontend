import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    Key key,
    this.press,
    this.title,
    this.subtitle,
    this.imgAdd,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Function press;
  final String imgAdd;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.0, color: Colors.grey[500]),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            SvgPicture.asset(imgAdd, height: 30),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins')),
                SizedBox(height: 5),
                Text(subtitle,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins')),
              ],
            ),
            Spacer(),
            Icon(Icons.arrow_forward)
          ],
        ),
      ),
    );
  }
}
