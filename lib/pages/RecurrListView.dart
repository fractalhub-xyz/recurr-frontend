import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:recurr_fe/Widgets/RecurrTile.dart';
import 'package:recurr_fe/models/recurr.dart';
import 'package:recurr_fe/redux/appState.dart';
import 'package:recurr_fe/sign_in.dart';

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

  Widget dateCard(day, date, score) {
    Color accent = Colors.blue;

    switch (score) {
      case "100":
        {
          accent = Colors.blue[400];
        }
        break;
      case "50":
        {
          accent = Colors.blue[200];
        }
        break;
      case "0":
        {
          accent = Colors.blue[100];
        }
        break;
    }

    return Container(
        width: 45,
        margin: EdgeInsets.only(left: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: accent),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(day),
            SizedBox(
              height: 10,
            ),
            Text(date),
          ],
        ));
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
                        'Hello $name !',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          imageUrl,
                        ),
                        radius: 20,
                        backgroundColor: Colors.transparent,
                      ),
                    ],
                  ),
                ),

                // ROW 2 : YOUR LOG + CHECKIN
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // TEXT: "YOUR LOGS"
                      Text(
                        'Your log',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      // CHECK IN BUTTON
                      RaisedButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, '/recur/checkin');
                        },
                        icon: Icon(
                          Icons.done_all,
                          size: 12,
                        ),
                        label: Text(
                          'Check in',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        color: Colors.grey[100],
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(),
                  height: 95.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      dateCard('Mon', '7', '100'),
                      dateCard('Mon', '7', '50'),
                      dateCard('Mon', '7', '100'),
                      dateCard('Mon', '7', '0'),
                      dateCard('Mon', '7', '50'),
                      dateCard('Mon', '7', '50'),
                      dateCard('Mon', '7', '0'),
                      dateCard('Mon', '7', '100'),
                      dateCard('Mon', '7', '0'),
                    ],
                  ),
                ),

                // ROW 4 : ADD RECUR BUTTON
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
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
                    child: ListView(
                      shrinkWrap: true,
                      children: recurrs
                          .map((recurr) => RecurrTile(recurr: recurr))
                          .toList(),
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
