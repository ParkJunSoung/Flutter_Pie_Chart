import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_rally/provider/provider_data.dart';
import 'package:flutter_ui_rally/ui/bills_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    BillsPage(),
    BillsPage(),
    BillsPage(),
  ];

  @override
  void initState() {
    super.initState();
    Provider.of<ReallyProvider>(context, listen: false);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _widgetOptions.elementAt(_selectedIndex),
            Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: SafeArea(
                child: GNav(
                  mainAxisAlignment: MainAxisAlignment.start,
                  rippleColor: Colors.grey[300],
                  hoverColor: Colors.grey[100],
                  gap: 8,
                  activeColor: Colors.white,
                  iconSize: 24,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: Duration(milliseconds: 400),
                  tabBackgroundColor: Colors.transparent,
                  color: Colors.white,
                  tabs: [
                    GButton(
                      icon: Icons.donut_small_outlined,
                      text: 'OVERVIEW',
                    ),
                    GButton(
                      icon: Icons.attach_money,
                      text: 'ACCOUNTS',
                    ),
                    GButton(
                      icon: Icons.money_off_rounded,
                      text: 'BILLS',
                    ),
                  ],
                  selectedIndex: _selectedIndex,
                  onTabChange: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
