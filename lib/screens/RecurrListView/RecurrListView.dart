import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:recurr_fe/constants.dart';
import 'package:recurr_fe/models/recurr.dart';
import 'package:recurr_fe/redux/state/app_state.dart';
import 'package:recurr_fe/screens/RecurrListView/components/calender.dart';
import 'package:recurr_fe/screens/RecurrListView/components/nameWithAvatar.dart';
import 'package:recurr_fe/screens/RecurrListView/components/quote.dart';
import 'package:recurr_fe/screens/RecurrListView/components/recurrCard.dart';
import 'package:recurr_fe/screens/RecurrListView/components/titleWithButton.dart';
import 'package:recurr_fe/utils/constants.dart';

class RecurrListView extends StatefulWidget {
  @override
  _RecurrListViewState createState() => _RecurrListViewState();
}

class _RecurrListViewState extends State<RecurrListView> {
  DateTime selectedDate;

  setDate(value) {
    setState(() {
      selectedDate = value;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<Recurr>>(
      converter: (store) => store.state.recurrs,
      builder: (BuildContext context, recurrs) {
        return Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                NameWithAvatar(),
                Quote(),
                TitleWithButton(
                  icon: Icons.done_all,
                  label: 'Your log',
                  iconlabel: 'check in',
                  press: () {
                    Navigator.pushNamed(context, '/recurr/checkin');
                  },
                ),
                Calender(setDate: setDate, selectedDate: selectedDate),

                //RecurListContainer
                getListContainer(recurrs)
              ],
            ),
          )),
        );
      },
    );
  }

  Widget getListContainer(List<Recurr> recurrs) {

    if (DateTime.now().day == selectedDate.day) {
      var todaysRecurrs = Recurr.getTodaysRecurrs(recurrs);
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleWithButton(
            icon: Icons.add,
            label: 'Today',
            iconlabel: 'new recur',
            press: () {
              Navigator.pushNamed(context, '/recurr/create');
            },
          ),
          Container(
              padding: EdgeInsets.only(top: EdgePadding * 0.3),
              // Only this needs list view cause only this changes order
              child: ListView.builder(
                itemCount: todaysRecurrs.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                key: Key(todaysRecurrs.length.toString()),
                itemBuilder: (BuildContext context, int index) {
                  return RecurrCard(
                    recurr: todaysRecurrs[index],
                    selectedDate: selectedDate,
                  );
                },
              )),
          Container(
            padding:
                EdgeInsets.symmetric(horizontal: EdgePadding, vertical: 10),
            child: Text(
              'Others',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: EdgePadding * 0.3),
            child: Column(
              children: Recurr.getOtherRecurrs(recurrs)
                  .map((recurr) => RecurrCard(recurr: recurr))
                  .toList(),
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          TitleWithButton(
            icon: Icons.add,
            label:
                'Viewing ${selectedDate.day} ${Constants.months[selectedDate.month - 1]}',
            iconlabel: 'new recur',
            press: () {
              Navigator.pushNamed(context, '/recurr/create');
            },
          ),
          Container(
            padding: EdgeInsets.only(top: EdgePadding * 0.3),
            child: Column(
              children: Recurr.getRecurrsByDate(recurrs, selectedDate)
                  .map((recurr) =>
                      RecurrCard(recurr: recurr, selectedDate: selectedDate))
                  .toList(),
            ),
          ),
        ],
      );
    }
  }
}
