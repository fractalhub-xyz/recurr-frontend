import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:recurr_fe/pages/RecurListView.dart';
import 'package:recurr_fe/models/recurr.dart';
import 'package:recurr_fe/redux/actions/recurr_actions.dart';
import 'package:recurr_fe/redux/appState.dart';

class CreateRecurView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
          appBar: AppBar(
            title: Text(appTitle),
          ),
          body: Container(
            padding: EdgeInsets.all(15),
            child: CreateRecurForm(),
          )),
    );
  }
}

// Create a Form widget.
class CreateRecurForm extends StatefulWidget {
  @override
  CreateRecurFormState createState() {
    return CreateRecurFormState();
  }
}

bool isNumeric(String s) {
  return true;
}

// Create a corresponding State class.
// This class holds data related to the form.
class CreateRecurFormState extends State<CreateRecurForm> {
  final _formKey = GlobalKey<FormState>();
  String title = 'Default';
  int duration = 10;
  bool check;
  double weight = 0;

  final create = FirebaseFunctions.instance.httpsCallable('createRecur');

  createRecur(BuildContext context) {
    // >>>>> Upload to cloud ?
    // try {
    //   final HttpsCallableResult result = await create.call(
    //     <String, dynamic>{
    //       'title': title,
    //       'duration': duration,
    //     },
    //   );
    //   print(result.data);
    //   showDialog(
    //     context: context,
    //     builder: (context) => AlertDialog(
    //       content: Column(
    //         children: [
    //           Text('Alert with ID ${result.data['id']} has been created'),
    //           RaisedButton(
    //               child: Text('Ok'),
    //               onPressed: () {
    //                 Navigator.pop(context);
    //               }),
    //         ],
    //       ),
    //     ),
    //   );
    // } catch (e) {
    //   showDialog(
    //     context: context,
    //     builder: (context) => AlertDialog(
    //       content: Column(
    //         children: [
    //           Text('Error $e has occured'),
    //         ],
    //       ),
    //     ),
    //   );
    //   print('caught generic exception');
    //   print(e);
    // }
    try {
      String uuid = DateTime.now().toIso8601String();
      String ts = DateTime.now().toIso8601String();
      var newRecur = Recurr(uuid, title, duration, ts);
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

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.assignment_turned_in_outlined),
              hintText: 'What would like to call your task',
              labelText: 'Recur Name',
            ),
            onSaved: (String value) {
              print('Recur name: $value');
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
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.access_time),
              hintText: 'What is the duration of the recur',
              labelText: 'Recur Duration',
            ),
            onSaved: (String value) {
              print('Duration: $value');
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
          Center(
            child: Slider(
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
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  print('weight $weight');
                  print('posted');
                  createRecur(context);
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
