import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:recurr_fe/models/recurr.dart';
import 'package:recurr_fe/redux/actions/recurr_actions.dart';
import 'package:recurr_fe/redux/state/app_state.dart';

import '../../constants.dart';
import 'components/headingAndSubheading.dart';

class SelectTeamView extends StatefulWidget {
  final String title;
  final int duration;
  final double weight;
  final List<bool> repeats;
  SelectTeamView({
    this.title,
    this.duration,
    this.weight,
    this.repeats,
  });
  @override
  _SelectTeamViewState createState() => _SelectTeamViewState();
}

class _SelectTeamViewState extends State<SelectTeamView> {
  createRecur(BuildContext context) {
    try {
      String uuid = DateTime.now().toIso8601String();
      String ts = DateTime.now().toIso8601String();
      var newRecur = Recurr(
        uuid,
        widget.title,
        ts,
        'team',
        widget.duration,
        widget.weight,
        widget.repeats,
      );
      StoreProvider.of<AppState>(context)
          .dispatch(AddRecurrAction(item: newRecur));
      // Navigator.pushNamed(context, '/recur/list');
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Column(
            children: [
              Text('Error $e has occured'),
            ],
          ),
        ),
      );
      print('caught generic exception');
      print(e);
    }
  }

  String team = 'Personal';

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
          'Pick Team',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: EdgePadding, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadingAndSubHeading(
                heading: 'Team', sub: 'Share progress with others in team - '),
            TextFormField(
              maxLength: 20,
              decoration: InputDecoration(
                  hintText: 'Squad', border: OutlineInputBorder()),
              onSaved: (String value) {
                setState(() {
                  team = value;
                });
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            FlatButton(
              padding: EdgeInsets.symmetric(vertical: 20),
              minWidth: double.infinity,
              color: Colors.teal,
              child: Text(
                'Create',
                style: TextStyle(color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              onPressed: () {
                createRecur(context);
                Navigator.popUntil(context, ModalRoute.withName('/home'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
