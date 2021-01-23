import 'package:flutter/material.dart';
import 'package:recurr_fe/models/recurr.dart';

class RecurrDetailView extends StatelessWidget {
  final Recurr recurr;

  RecurrDetailView({this.recurr});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hi'),
      ),
    );
  }
}
