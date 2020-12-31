import 'package:flutter/material.dart';

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
  String recurName;
  int duration;
  bool check;
  double weight = 0;

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
