import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';

class RecurListScreen extends StatefulWidget {
  RecurListScreen({Key key}) : super(key: key);

  @override
  _RecurListState createState() {
    return _RecurListState();
  }
}

class _RecurListState extends State<RecurListScreen> {
  Future<List> recursFuture;

  @override
  void initState() async {
    super.initState();
    recursFuture = getRecurs();
  }

  Future<List> getRecurs() async {
    HttpsCallable callable = FirebaseFunctions.instance.httpsCallable('getAllRecurs');
    final results = await callable();
    return results.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: FutureBuilder(
              future: recursFuture,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  List recurs = snapshot.data;
                  return ListView.builder(
                    itemCount: recurs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                          title: Text('${recurs[index].title}')
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return CircularProgressIndicator();
              })
        )
    );
  }
}