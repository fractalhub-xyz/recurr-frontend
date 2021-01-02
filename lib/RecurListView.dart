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
      child: ListTile(
        leading: GestureDetector(
          onTap: () {
            print('taptaptap');
          },
          child: Container(
            width: 48,
            height: 48,
            padding: EdgeInsets.symmetric(vertical: 4.0),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('List View')),
      ),
      body: Center(
        child: FutureBuilder(
          future: recurs,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              List recurs = snapshot.data;
              return ListView(
                children: recurs.map((recur) => recurCard(recur)).toList(),
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
