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

class RecurrListView extends StatefulWidget {
  @override
  _RecurrListViewState createState() => _RecurrListViewState();
}

class _RecurrListViewState extends State<RecurrListView> {
  List<Recurr> recurrs;
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
                getListContainer(selectedDate, recurrs, context, selectedDate)
              ],
            ),
          )),
        );
      },
    );
  }
}

Widget getListContainer(date, recurrs, context, selectedDate) {
  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December	',
  ];
  if (DateTime.now().day == date.day) {
    return Column(
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
          child: Column(
            children: Recurr.getTodaysRecurrs(recurrs)
                .map((recurr) =>
                    RecurrCard(recurr: recurr, selectedDate: selectedDate))
                .toList(),
          ),
        ),
        Text('Others', textAlign: TextAlign.left),
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
          label: 'Viewing ${date.day} ${months[date.month - 1]}',
          iconlabel: 'new recur',
          press: () {
            Navigator.pushNamed(context, '/recurr/create');
          },
        ),
        Container(
          padding: EdgeInsets.only(top: EdgePadding * 0.3),
          child: Column(
            children: Recurr.getRecurrsByDate(recurrs, date)
                .map((recurr) =>
                    RecurrCard(recurr: recurr, selectedDate: selectedDate))
                .toList(),
          ),
        ),
      ],
    );
  }
}
