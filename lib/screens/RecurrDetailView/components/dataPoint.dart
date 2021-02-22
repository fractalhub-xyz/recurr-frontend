import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DataPoint extends StatelessWidget {
  const DataPoint({
    Key key,
    this.title,
    this.data,
    this.imgAdd,
  }) : super(key: key);

  final String title;
  final String imgAdd;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(imgAdd, height: 24),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                  fontSize: 14),
            ),
            Text(
              data,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 14),
            ),
          ],
        )
      ],
    );
  }
}

// Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             SvgPicture.asset(imgAdd, height: 22),
//             SizedBox(width: 4),
//             Text(
//               title,
//               style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w300,
//                   fontSize: 16),
//             ),
//           ],
//         ),
//         SizedBox(height: 3),
//         Text(
//           data,
//           style: TextStyle(
//               fontFamily: 'Poppins', fontWeight: FontWeight.w600, fontSize: 20),
//         ),
//       ],
//     );
