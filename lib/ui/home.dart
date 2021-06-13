import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_rally/ui/accounts_page.dart';
import 'package:flutter_ui_rally/ui/bills_page.dart';
import 'package:flutter_ui_rally/ui/overview_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    OverviewPage(),
    BillsPage(),
    AccountsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(49, 50, 55, 1),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: Row(
                  children: [
                    GNav(
                      rippleColor: Colors.grey[300],
                      hoverColor: Colors.grey[100],
                      gap: 8,
                      activeColor: Colors.black,
                      iconSize: 24,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      duration: Duration(milliseconds: 400),
                      tabBackgroundColor: Color.fromRGBO(49, 50, 55, 1),
                      color: Colors.black,
                      tabs: [
                        GButton(
                          icon: Icons.home,
                          text: 'Home',
                        ),
                        GButton(
                          icon: Icons.three_k_plus,
                          text: 'Likes',
                        ),
                        GButton(
                          icon: Icons.search,
                          text: 'Search',
                        ),
                      ],
                      selectedIndex: _selectedIndex,
                      onTabChange: (index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            _widgetOptions.elementAt(_selectedIndex),
          ],
        ),
      ),
    );
  }
}
