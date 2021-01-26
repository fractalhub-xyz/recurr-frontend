import 'package:flutter/material.dart';
import 'package:recurr_fe/models/recurr.dart';
import 'package:recurr_fe/screens/CheckinView/components/checkinCard.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';

import '../../constants.dart';
import 'components/dateAndCheckAllBtn.dart';

class CheckinView extends StatefulWidget {
  @override
  _CheckinViewState createState() => _CheckinViewState();
}

class _CheckinViewState extends State<CheckinView> {
  bool checkall = false;
  @override
  Widget build(BuildContext context) {
    void confirmed() {
      print('Slider confirmed!');
    }

    setCheckAll(value) {
      setState(() {
        checkall = value;
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
          'Daily Checkin',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: EdgePadding),
          child: Column(
            children: [
              SizedBox(height: 20),
              DateAndCheckallBtn(checkall: checkall, setCheckAll: setCheckAll),
              Container(
                child: Column(
                  children: [
                    CheckinCard(
                        recurr: Recurr('id', 'title', '12.213.12', 'team', 12,
                            1.2, [true, false, true, false, true, true, true]),
                        checkall: checkall),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(40),
                child: ConfirmationSlider(
                  onConfirmation: () => confirmed(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
