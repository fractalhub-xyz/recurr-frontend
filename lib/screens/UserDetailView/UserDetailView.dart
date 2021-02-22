import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:recurr_fe/constants.dart';
import 'package:recurr_fe/screens/UserDetailView/NotificationTimePicker.dart';
import 'package:recurr_fe/screens/UserDetailView/components/header.dart';
import 'package:recurr_fe/screens/UserDetailView/components/logoutButton.dart';
import 'package:recurr_fe/screens/UserDetailView/components/profileMenuItem.dart';

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
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: false,
          title: Text(
            'Profile',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          // actions: [
          //   IconButton(
          //       icon: Icon(
          //         Icons.edit,
          //         color: Colors.black,
          //       ),
          //       onPressed: () {
          //         print('implement edit');
          //       })
          // ],
        ),
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
                  title: 'Inactive Recurrs',
                  subtitle: 'Recurs used more than 30 days ago',
                  press: () {},
                  imgAdd: "assets/icons/hibernation.svg",
                ),
                ProfileMenuItem(
                    title: 'Notification Time',
                    subtitle: 'Notification set for xxx am',
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NotificationTimePicker(
                                    time: time,
                                    setTime: setTime,
                                  )));
                    },
                    imgAdd: "assets/icons/notification.svg"),
                ProfileMenuItem(
                  title: 'Invite Friends',
                  subtitle: 'We all got that lazy friend, push them! ',
                  press: () {},
                  imgAdd: "assets/icons/friends.svg",
                ),
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
