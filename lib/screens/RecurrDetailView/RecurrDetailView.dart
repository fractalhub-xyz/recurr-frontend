import 'package:flutter/material.dart';
import 'package:recurr_fe/constants.dart';
import 'package:recurr_fe/models/recurr.dart';
import 'package:recurr_fe/screens/RecurrDetailView/components/header.dart';
import 'components/log.dart';
import 'components/overview.dart';

class RecurrDetailView extends StatefulWidget {
  final Recurr recurr;

  RecurrDetailView({this.recurr});

  @override
  _RecurrDetailViewState createState() => _RecurrDetailViewState(recurr);
}

class _RecurrDetailViewState extends State<RecurrDetailView> {
  Recurr recurr;
  _RecurrDetailViewState(this.recurr);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    // setSelection(choice) {
    //   setState(() {
    //     selection = choice;
    //   });
    // }

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(title: 'Overview'),
              Overview(recurr: recurr),
              // ScoreAndStreakCard(streak: recurr.getStreak()),
              // RepeatDaysAndGroup(
              //     team: recurr.team, repeatString: recurr.getRepeatString()),
              // SizedBox(height: 10),
              // MomemtumHeader(setSelection: setSelection, selection: selection),
              // Momentum(height: height, recurr: recurr),
              Header(title: 'Your log'),
              Log(height: height),
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
