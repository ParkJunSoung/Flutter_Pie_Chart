import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ui_rally/provider/provider_data.dart';
import 'package:provider/provider.dart';

class AccountsOverview extends StatefulWidget {
  const AccountsOverview({Key key}) : super(key: key);

  @override
  _AccountsOverviewState createState() => _AccountsOverviewState();
}

class _AccountsOverviewState extends State<AccountsOverview> {
  @override
  Widget build(BuildContext context) {
    var list = context.read<ReallyProvider>();
    return Column(
      children: [
        Container(
          color: Color.fromRGBO(49, 50, 55, 1),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        'Alerts',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'SEE ALL',
                          style: TextStyle(color: Colors.greenAccent),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromRGBO(49, 50, 55, 1))),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      Text(
                        'Heads up, you\'ve used up 90% of your \n Shopping budget for this month',
                        style: TextStyle(color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 120),
                        child: Icon(
                          Icons.attachment,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
