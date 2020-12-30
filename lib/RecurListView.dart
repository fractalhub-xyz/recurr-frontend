import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';

class RecurListView extends StatefulWidget {
  @override
  _RecurListViewState createState() => _RecurListViewState();
}

Future<List> getRecurs() async {
  HttpsCallable callable =
      FirebaseFunctions.instance.httpsCallable('getAllRecurs');
  final results = await callable();
  return results.data;
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
      appBar: AppBar(),
      body: Center(
        child: FutureBuilder(
          future: recurs,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              List recurs = snapshot.data;
              return ListView.builder(
                itemCount: recurs.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(title: Text('${recurs[index].title}'));
                },
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('+'),
      ),
    );
  }
}
