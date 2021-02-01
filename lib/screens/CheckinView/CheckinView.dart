import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:recurr_fe/models/recurr.dart';
import 'package:recurr_fe/redux/actions/recurr_actions.dart';
import 'package:recurr_fe/redux/state/app_state.dart';
import 'package:recurr_fe/screens/CheckinView/components/checkinCard.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';

import 'components/dateAndCheckAllBtn.dart';

typedef void CheckinCallback(String recurID, bool isChecked);

class CheckinView extends StatefulWidget {
  @override
  _CheckinViewState createState() => _CheckinViewState();
}

class _CheckinViewState extends State<CheckinView> {
  bool checkall = false;
  Set<String> selectedRecurs = {};

  void onCheckRecur(String recurID, bool isChecked) {
    if (isChecked) {
      selectedRecurs.add(recurID);
    } else {
      selectedRecurs.remove(recurID);
    }
    print(selectedRecurs);
  }

  void onSwipeConfirmed() {
    if (selectedRecurs.length == 0) {
      print("no recurs selected to check in");
      return;
    }

    StoreProvider.of<AppState>(context).dispatch(CheckInAction(
      recurIds: selectedRecurs.toList(),
    ));
  }

  void onCheckAll(value) {
    setState(() {
      checkall = value;
    });
  }

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
          child: Column(
            children: [
              SizedBox(height: 20),
              DateAndCheckallBtn(checkall: checkall, setCheckAll: onCheckAll),
              // Recur Container
              CheckinRecurContainer(
                checkall: checkall,
                onCheckRecur: onCheckRecur,
              ),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(40),
                child: ConfirmationSlider(
                  text: "Slide to checkin",
                  onConfirmation: onSwipeConfirmed,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CheckinRecurContainer extends StatelessWidget {
  const CheckinRecurContainer({
    Key key,
    @required this.checkall,
    @required this.onCheckRecur,
  }) : super(key: key);

  final bool checkall;
  final CheckinCallback onCheckRecur;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<Recurr>>(
        converter: (store) => store.state.recurrs,
        builder: (BuildContext context, recurrs) {
          return Container(
            height:
                Recurr.getRecurrsToCheckIn(recurrs).length.roundToDouble() * 85,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: Recurr.getRecurrsToCheckIn(recurrs).length,
              itemBuilder: (context, index) {
                return CheckinCard(
                  recurr: Recurr.getRecurrsToCheckIn(recurrs)[index],
                  checkall: checkall,
                  onCheckRecur: onCheckRecur,
                );
              },
            ),
          );
        });
  }
}

// Container(
//             child: Column(
//               children: Recurr.getRecurrsToCheckIn(recurrs)
//                   .map((recurr) => CheckinCard(
//                         recurr: recurr,
//                         checkall: checkall,
//                         onCheckRecur: onCheckRecur,
//                       ))
//                   .toList(),
//             ),
//           );
