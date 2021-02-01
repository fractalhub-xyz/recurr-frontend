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
  bool mon = false;
  bool tue = false;
  bool wed = false;
  bool thr = false;
  bool fri = false;
  bool sat = false;
  bool sun = false;
  String repeatSelection = 'Everyday';
  List<String> importance = ['Not Very', 'Important', 'I can\'t miss it'];

  Widget getDayPicker() {
    if (repeatSelection == 'I\'ll choose') {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: Colors.grey[200]),
        padding: EdgeInsets.only(top: 13, bottom: 5),
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
              ],
            ),
          ],
        ),
      );
    } else {
      return SizedBox();
    }
  }

  Widget customRadio(setas) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Radio(
              value: setas,
              groupValue: repeatSelection,
              onChanged: (value) {
                setState(() {
                  repeatSelection = value;
                });
              }),
          Text(
            setas,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
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
                    fillColor: Colors.grey[200],
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
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500]),
                    borderRadius: BorderRadius.circular(borderRadius)),
                padding: EdgeInsets.only(bottom: 9),
                margin: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    customRadio('Everyday'),
                    customRadio('Weekdays'),
                    customRadio('Weekends'),
                    customRadio('I\'ll choose'),
                  ],
                ),
              ),
              getDayPicker(),
              // //Duration
              // TextFormField(
              //   decoration: InputDecoration(
              //       hintText: 'Ex. Drink Water', border: OutlineInputBorder()),
              //   onSaved: (String value) {
              //     setState(() {
              //       duration = int.parse(value);
              //     });
              //   },
              //   validator: (value) {
              //     if (value.isEmpty) {
              //       if (isNumeric(value)) {
              //         return 'Enter a numeric value';
              //       }
              //     }
              //     return null;
              //   },
              // ),
              // //Weight
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
                    List<bool> repeats = [];
                    if (repeatSelection == 'Everyday') {
                      repeats = [true, true, true, true, true, true, true];
                    } else if (repeatSelection == 'Weekdays') {
                      repeats = [true, true, true, true, true, false, false];
                    } else if (repeatSelection == 'Weekends') {
                      repeats = [false, false, false, false, false, true, true];
                    } else if (repeatSelection == 'I\'ll choose') {
                      repeats = [mon, tue, wed, thr, fri, sat, sun];
                    }
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
