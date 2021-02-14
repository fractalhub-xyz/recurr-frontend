import 'package:flutter/material.dart';
import 'package:recurr_fe/screens/CreateRecurrView/SelectTeamView.dart';
import '../../constants.dart';
import 'components/headingAndSubheading.dart';

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
  int duration = 7;
  double weight = 0;
  bool mon = true;
  bool tue = true;
  bool wed = true;
  bool thr = true;
  bool fri = true;
  bool sat = true;
  bool sun = true;
  String repeatSelection = 'Everyday';
  List<String> importance = ['Not Very', 'Important', 'I can\'t miss it'];

  updateSelectedDays() {
    if (repeatSelection == 'Everyday') {
      setState(() {
        mon = true;
        tue = true;
        wed = true;
        thr = true;
        fri = true;
        sat = true;
        sun = true;
      });
    } else if (repeatSelection == 'Weekdays') {
      mon = true;
      tue = true;
      wed = true;
      thr = true;
      fri = true;
      sat = false;
      sun = false;
    } else if (repeatSelection == 'Weekends') {
      mon = false;
      tue = false;
      wed = false;
      thr = false;
      fri = false;
      sat = true;
      sun = true;
    }
  }

  Widget getDayPicker() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    mon = !mon;
                  });
                },
                child: Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: mon == true ? Colors.blue : Colors.grey),
                  child: Center(
                    child: Text(
                      'M',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    tue = !tue;
                  });
                },
                child: Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: tue == true ? Colors.blue : Colors.grey),
                  child: Center(
                    child: Text(
                      'T',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    wed = !wed;
                  });
                },
                child: Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: wed == true ? Colors.blue : Colors.grey),
                  child: Center(
                    child: Text(
                      'W',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    thr = !thr;
                  });
                },
                child: Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: thr == true ? Colors.blue : Colors.grey),
                  child: Center(
                    child: Text(
                      'T',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    fri = !fri;
                  });
                },
                child: Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: fri == true ? Colors.blue : Colors.grey),
                  child: Center(
                    child: Text(
                      'F',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sat = !sat;
                  });
                },
                child: Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: sat == true ? Colors.blue : Colors.grey),
                  child: Center(
                    child: Text(
                      'S',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sun = !sun;
                  });
                },
                child: Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: sun == true ? Colors.blue : Colors.grey),
                  child: Center(
                    child: Text(
                      'S',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget customRadio(setas) {
    return Row(
      children: [
        Radio(
            value: setas,
            groupValue: repeatSelection,
            onChanged: (value) {
              setState(() {
                repeatSelection = value;
              });
              updateSelectedDays();
            }),
        Text(
          setas,
          style: TextStyle(fontSize: 12),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }

  // MAIN BUILD FUNCTION
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              HeadingAndSubHeading(heading: 'Title', sub: 'Name your recurr'),
              //RecurName
              TextFormField(
                maxLength: 20,
                decoration: InputDecoration(
                    hintText: 'Ex. Drink Water',
                    border: OutlineInputBorder(),
                    fillColor: Colors.grey[100],
                    filled: true),
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
              HeadingAndSubHeading(
                  heading: 'Recurrtions',
                  sub: 'How often would you like to follow this recurr'),
              Container(
                padding: EdgeInsets.only(bottom: 9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    customRadio('Everyday'),
                    customRadio('Weekdays'),
                    customRadio('Weekends'),
                  ],
                ),
              ),
              getDayPicker(),

              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: HeadingAndSubHeading(
                    heading: 'Importance',
                    sub:
                        'We will evaluate your score based on the imporatance of your recurr'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Slider(
                        activeColor: Colors.teal,
                        value: weight,
                        min: 0,
                        max: 2,
                        divisions: 2,
                        label: importance[weight.round()],
                        onChanged: (double value) {
                          setState(() {
                            weight = value;
                          });
                        }),
                  ],
                ),
              ),

              FlatButton(
                padding: EdgeInsets.symmetric(vertical: 20),
                minWidth: double.infinity,
                color: Colors.teal,
                child: Text(
                  'Next',
                  style: TextStyle(color: Colors.white),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    List<bool> repeats = [mon, tue, wed, thr, fri, sat, sun];
                    print(repeats);
                    if (repeats.every((val) => val == false)) {
                      AlertDialog alert = AlertDialog(
                        title: Text("Uh-oh!"),
                        content: Text("Looks like you did not pick any day"),
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SelectTeamView(
                                  title: title,
                                  duration: duration,
                                  weight: weight,
                                  repeats: repeats,
                                )),
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
