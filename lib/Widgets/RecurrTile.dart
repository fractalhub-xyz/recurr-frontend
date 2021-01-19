import 'package:flutter/material.dart';
import 'package:recurr_fe/models/recurr.dart';
import 'package:recurr_fe/pages/RecurDetailView.dart';

class RecurrTile extends StatelessWidget {
  final Recurr recurr;
  RecurrTile({this.recurr});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 9),
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Ink(
        color: Colors.grey[200],
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecurDetailView(recur: recurr),
              ),
            );
          },
          splashColor: Colors.grey[300],
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      recurr.title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Text(
                            'group',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Icon(Icons.group),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('weekdays'),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Text(
                            '0/${recurr.duration}',
                            style: TextStyle(
                              fontSize: 11,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.done_all,
                          size: 11,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
