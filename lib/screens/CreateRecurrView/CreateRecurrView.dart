import 'package:flutter/material.dart';
import '../../constants.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:recurr_fe/models/recurr.dart';
import 'package:recurr_fe/redux/actions/recurr_actions.dart';
import 'package:recurr_fe/redux/state/app_state.dart';

class CreateRecurrView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: false,
          title: Text(
            'Create Recurr',
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
          child: CreateRecurrForm(),
        ),
      ),
    );
  }
}

// Create a Form widget.
class CreateRecurrForm extends StatefulWidget {
  @override
  CreateRecurrFormState createState() {
    return CreateRecurrFormState();
  }
}

bool isNumeric(String s) {
  return true;
}

// Create a corresponding State class.
// This class holds data related to the form.
class CreateRecurrFormState extends State<CreateRecurrForm> {
  final _formKey = GlobalKey<FormState>();
  String title = 'TITLE';
  String team = 'PERSONAL';
  int duration = 7;
  double weight = 50;
  bool sun = false;
  bool mon = false;
  bool tue = false;
  bool wed = false;
  bool thr = false;
  bool fri = false;
  bool sat = false;

  @override
  Widget build(BuildContext context) {
    createRecur(BuildContext context) {
      try {
        String uuid = DateTime.now().toIso8601String();
        String ts = DateTime.now().toIso8601String();
        var newRecur = Recurr(uuid, title, ts, team, duration, weight,
            [sun, mon, tue, wed, thr, fri, sat]);
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

    // Build a Form widget using the _formKey created above.
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //RecurName
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.assignment_turned_in_outlined),
                hintText: 'What would like to call your task',
                labelText: 'Recur Name',
              ),
              onSaved: (String value) {
                setState(() {
                  title = value;
                });
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            //Duration
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.access_time),
                hintText: 'What is the duration of the recur',
                labelText: 'Recur Duration',
              ),
              onSaved: (String value) {
                setState(() {
                  duration = int.parse(value);
                });
              },
              validator: (value) {
                if (value.isEmpty) {
                  if (isNumeric(value)) {
                    return 'Enter a numeric value';
                  }
                }
                return null;
              },
            ),
            //Weight
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Slider(
                      value: weight,
                      min: 0,
                      max: 100,
                      divisions: 100,
                      label: weight.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          weight = value;
                        });
                      }),
                  Text('Weight'),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  color: Colors.grey[200]),
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text('sun'),
                          Checkbox(
                              value: sun,
                              onChanged: (value) {
                                setState(() {
                                  sun = value;
                                });
                              })
                        ],
                      ),
                      Column(
                        children: [
                          Text('mon'),
                          Checkbox(
                              value: mon,
                              onChanged: (value) {
                                setState(() {
                                  mon = value;
                                });
                              })
                        ],
                      ),
                      Column(
                        children: [
                          Text('tue'),
                          Checkbox(
                              value: tue,
                              onChanged: (value) {
                                setState(() {
                                  tue = value;
                                });
                              })
                        ],
                      ),
                      Column(
                        children: [
                          Text('wed'),
                          Checkbox(
                              value: wed,
                              onChanged: (value) {
                                setState(() {
                                  wed = value;
                                });
                              })
                        ],
                      ),
                      Column(
                        children: [
                          Text('thr'),
                          Checkbox(
                              value: thr,
                              onChanged: (value) {
                                setState(() {
                                  thr = value;
                                });
                              })
                        ],
                      ),
                      Column(
                        children: [
                          Text('fri'),
                          Checkbox(
                              value: fri,
                              onChanged: (value) {
                                setState(() {
                                  fri = value;
                                });
                              })
                        ],
                      ),
                      Column(
                        children: [
                          Text('sat'),
                          Checkbox(
                              value: sat,
                              onChanged: (value) {
                                setState(() {
                                  sat = value;
                                });
                              })
                        ],
                      ),
                    ],
                  ),
                  Text('Repeat on')
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.keyboard_arrow_right),
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.

                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();

                  print('Next');
                  createRecur(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
