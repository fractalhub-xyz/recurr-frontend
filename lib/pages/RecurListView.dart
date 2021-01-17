import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:recurr_fe/pages/AddRecurView.dart';
import 'package:recurr_fe/Widgets/RecurTile.dart';

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
                      List recurrs = snapshot.data;
                      return ListView(
                        shrinkWrap: true,
                        children: recurrs
                            .map((recurr) => RecurTile(recurr: recurr))
                            .toList(),
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
