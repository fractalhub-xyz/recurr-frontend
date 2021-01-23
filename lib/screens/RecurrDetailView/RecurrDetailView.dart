import 'package:flutter/material.dart';
import 'package:recurr_fe/models/recurr.dart';

class RecurrDetailView extends StatelessWidget {
  final Recurr recurr;

  RecurrDetailView({this.recurr});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: false,
        title: Text(
          recurr.title,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
              icon: Icon(
                Icons.edit,
                color: Colors.black,
              ),
              onPressed: () {
                print('implement edit');
              })
        ],
      ),
    );
  }
}
