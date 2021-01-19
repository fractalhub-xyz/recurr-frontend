import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:recurr_fe/Widgets/RecurrTile.dart';
import 'package:recurr_fe/models/recurr.dart';
import 'package:recurr_fe/redux/appState.dart';

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
  Future<List> recurs;

  @override
  void initState() {
    super.initState();
    recurs = getRecurs();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<Recurr>>(
      converter: (store) => store.state.recurrs,
      builder: (BuildContext context, recurrs) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                // TOP PADDING
                SizedBox(
                  height: 10,
                ),
                // ROW 1: HELLO USER + AVATAR
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // HELLO USER
                      Text(
                        'Hello User ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      CircleAvatar(),
                    ],
                  ),
                ),

                // ROW 2 : ADD RECUR BUTTON
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // TEXT: "YOUR RECURS"
                      Text(
                        'Your recurs',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      // CREATE RECUR BUTTON
                      RaisedButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, '/recur/create');
                        },
                        icon: Icon(
                          Icons.add,
                          size: 12,
                        ),
                        label: Text(
                          'new habit',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        color: Colors.grey[100],
                      ),
                    ],
                  ),
                ),

                // LIST OF RECURRS
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(),
                    padding: const EdgeInsets.all(7.0),
                    child: Center(
                      child: ListView(
                        shrinkWrap: true,
                        children: recurrs
                            .map((recurr) => RecurrTile(recurr: recurr))
                            .toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
