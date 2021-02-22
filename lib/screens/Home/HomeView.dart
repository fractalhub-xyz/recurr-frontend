import 'package:flutter/material.dart';
import 'package:recurr_fe/screens/Dashboard/dashboard.dart';
import 'package:recurr_fe/screens/GroupListView/GroupListView.dart';
import 'package:recurr_fe/screens/RecurrListView/RecurrListView.dart';
import 'package:recurr_fe/screens/UserDetailView/UserDetailView.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  PageController _pageController = PageController(
    initialPage: 1,
  );
  int currentIndex = 1;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey[500],
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          _pageController.animateToPage(
            value,
            duration: Duration(milliseconds: 200),
            curve: Curves.linear,
          );

          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.timeline),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_sharp),
            label: "Teams",
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (page) {
          setState(() {
            currentIndex = page;
          });
        },
        children: <Widget>[
          Dashboard(),
          RecurrListView(),
          GroupListView(),
        ],
      ),
    );
  }
}
