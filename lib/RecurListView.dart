import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:recurr_fe/addrecur.dart';

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

  Widget recurCard(recur) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
        ),
        child: ListTile(
          leading: GestureDetector(
            onTap: () {
              print('taptaptap');
            },
            child: Container(
              width: 48,
              height: 68,
              padding: EdgeInsets.symmetric(vertical: 8.0),
              alignment: Alignment.center,
              child: CircleAvatar(),
            ),
          ),
          title: Text(recur['title']),
          subtitle: Text('A sufficiently long subtitle warrants three lines.'),
          trailing: Icon(Icons.more_vert),
          isThreeLine: true,
          onTap: () {
            print('opening detail page of recur ${recur['title']}');
          },
          enabled: true,
        ),
      ),
    );
  }

  Widget recurCard2(recur) {
    return GestureDetector(
      onTap: () {
        print('opening detail page of recur ${recur['title']}');
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 7),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Card(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 12),
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
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                            recurs.map((recur) => recurCard2(recur)).toList(),
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
