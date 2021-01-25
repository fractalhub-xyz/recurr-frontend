import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';
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

Future<List> getRecurs() async {
  HttpsCallable callable =
      FirebaseFunctions.instance.httpsCallable('getAllRecurs');
  final results = await callable();
  return results.data['data'];
}

class _RecurrListViewState extends State<RecurrListView> {
  Future<List> recurrs;

  @override
  void initState() {
    super.initState();
    recurrs = getRecurs();
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
                Calender(),
                TitleWithButton(
                  icon: Icons.add,
                  label: 'Today',
                  iconlabel: 'new recur',
                  press: () {
                    Navigator.pushNamed(context, '/recurr/create');
                  },
                ),
                //RecurListContainer
                Container(
                  padding: EdgeInsets.only(top: EdgePadding * 0.3),
                  child: Column(
                    children: recurrs
                        .map((recurr) => RecurrCard(recurr: recurr))
                        .toList(),
                  ),
                )
              ],
            ),
          )),
        );
      },
    );
  }
}
