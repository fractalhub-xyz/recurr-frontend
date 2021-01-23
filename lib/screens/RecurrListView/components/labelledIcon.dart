import 'package:flutter/cupertino.dart';

class LabelledIcon extends StatelessWidget {
  const LabelledIcon({
    Key key,
    this.label,
    this.icon,
  }) : super(key: key);

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label),
        SizedBox(width: 5),
        Icon(icon),
      ],
    );
  }
}
