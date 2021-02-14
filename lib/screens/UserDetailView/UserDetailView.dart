import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:recurr_fe/constants.dart';
import 'package:recurr_fe/screens/UserDetailView/NotificationTimePicker.dart';
import 'package:recurr_fe/screens/UserDetailView/components/header.dart';
import 'package:recurr_fe/screens/UserDetailView/components/logoutButton.dart';
import 'package:recurr_fe/screens/UserDetailView/components/profileMenuItem.dart';
import 'package:recurr_fe/utils/notifications/notifications.dart';

class UserDetailView extends StatefulWidget {
  @override
  _UserDetailViewState createState() => _UserDetailViewState();
}

class _UserDetailViewState extends State<UserDetailView> {
  DateTime time = DateTime.now();

  setTime(value) {
    setState(() {
      time = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          child: Padding(
        padding: const EdgeInsets.all(EdgePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(),
            Container(
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  'Account',
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins'),
                )),
            ProfileMenuItem(
                text: 'Inactive Recurrs', press: () {}, icon: Icons.apps),
            ProfileMenuItem(
                text: 'Notification Time',
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationTimePicker(
                                time: time,
                                setTime: setTime,
                              )));
                },
                icon: Icons.circle_notifications),
            ProfileMenuItem(
                text: 'Invite Friends', press: () {}, icon: Icons.hail),
            Spacer(),
            LogoutButton(),
            // RaisedButton(
            //   child: Text('Show active notif'),
            //   onPressed: () {
            //     LocalNotification notification = LocalNotification(context);
            //     dynamic activenotifs = notification.getActiveNotif();
            //     activenotifs.then(print(activenotifs));
            //   },
            // ),
          ],
        ),
      )),
    ));
  }
}

// Container(
//         width: double.infinity,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             RaisedButton(
//               child: Text('Show active notif'),
//               onPressed: () {
//                 LocalNotification notification = LocalNotification(context);
//                 dynamic activenotifs = notification.getActiveNotif();
//                 activenotifs.then(print(activenotifs));
//               },
//             ),
//             RaisedButton(
//               child: Text('Log out'),
//               onPressed: () async {
//                 await _signOut();
//                 Navigator.popUntil(context, ModalRoute.withName('/'));
//                 Navigator.pushReplacementNamed(context, '/login');
//               },
//             ),
//             RaisedButton(
//               child: Text('set time for notif'),
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => NotificationTimePicker(
//                               time: time,
//                               setTime: setTime,
//                             )));
//               },
//             ),
//             Text('$time'),
//           ],
//         ),
//       ),
