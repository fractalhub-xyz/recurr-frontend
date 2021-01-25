import 'package:flutter/material.dart';
import 'package:recurr_fe/constants.dart';
import 'package:recurr_fe/models/recurr.dart';
import 'components/log.dart';
import 'components/logHeader.dart';
import 'components/momemtumGraph.dart';
import 'components/momemtumHeader.dart';
import 'components/scoreAndStreamCard.dart';
import 'components/repeatDaysAndGroup.dart';

class RecurrDetailView extends StatefulWidget {
  final Recurr recurr;

  RecurrDetailView({this.recurr});

  @override
  _RecurrDetailViewState createState() => _RecurrDetailViewState();
}

class _RecurrDetailViewState extends State<RecurrDetailView> {
  String selection = 'weekly';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    setSelection(choice) {
      setState(() {
        selection = choice;
      });
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: false,
        title: Text(
          widget.recurr.title,
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: EdgePadding),
          child: Column(
            children: [
              SizedBox(height: 20),
              ScoreAndStreakCard(),
              RepeatDaysAndGroup(),
              SizedBox(height: 10),
              MomemtumHeader(setSelection: setSelection, selection: selection),
              Momentum(height: height),
              LogHeader(),
              Log(height: height),
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
