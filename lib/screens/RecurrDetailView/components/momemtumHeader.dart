import 'package:flutter/material.dart';

import '../../../constants.dart';

class MomemtumHeader extends StatelessWidget {
  const MomemtumHeader({
    Key key,
    @required this.setSelection,
    this.selection,
  }) : super(key: key);

  final Function setSelection;
  final String selection;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(EdgePadding),
      child: Row(
        children: [
          Text(
            'Momentum',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins'),
          ),
          Spacer(),
          PopupMenuButton(
            onSelected: (value) {
              setSelection(value);
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'weekly',
                child: Row(
                  children: [
                    Icon(Icons.directions_bike),
                    SizedBox(width: 5),
                    Text('weekly'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'montly',
                child: Row(
                  children: [
                    Icon(Icons.directions_car),
                    SizedBox(width: 5),
                    Text('montly'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'yearly',
                child: Row(
                  children: [
                    Icon(Icons.flight),
                    SizedBox(width: 5),
                    Text('yearly'),
                  ],
                ),
              ),
            ],
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(borderRadius)),
                padding: EdgeInsets.only(top: 1, bottom: 1, left: 8, right: 4),
                child: Row(
                  children: [
                    Text(selection),
                    Icon(Icons.arrow_drop_down),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
