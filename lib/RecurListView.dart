import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:recurr_fe/AddRecurView.dart';
import 'package:recurr_fe/RecurDetailView.dart';

class RecurListView extends StatefulWidget {
  @override
  _RecurListViewState createState() => _RecurListViewState();
}

Future<List> getRecurs() async {
  HttpsCallable callable =
      FirebaseFunctions.instance.httpsCallable('getAllRecurs');
  final results = await callable();
  return results.data['data'];
}

class _RecurListViewState extends State<RecurListView> {
  Future<List> recurs;

  @override
  void initState() {
    super.initState();
    recurs = getRecurs();
  }

  @override
  Widget build(BuildContext context) {
    Widget recurCard(recur) {
      return Container(
        margin: EdgeInsets.only(bottom: 9),
        foregroundDecoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Ink(
          color: Colors.grey[200],
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecurDetailView(),
                ),
              );
            },
            splashColor: Colors.grey[300],
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        recur['title'],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Text(
                              'group',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Icon(Icons.group),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('weekdays'),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Text(
                              '7/8',
                              style: TextStyle(
                                fontSize: 11,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.done_all,
                            size: 11,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your recurs',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  RaisedButton.icon(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return CreateRecurView();
                      }));
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
            Container(
              decoration: BoxDecoration(),
              padding: const EdgeInsets.all(7.0),
              child: Center(
                child: FutureBuilder(
                  future: recurs,
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      List recurs = snapshot.data;
                      return ListView(
                        shrinkWrap: true,
                        children:
                            recurs.map((recur) => recurCard(recur)).toList(),
                      );
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
