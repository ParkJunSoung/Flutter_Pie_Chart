import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_rally/provider/provider_data.dart';
import 'package:provider/provider.dart';

class BillsOverview extends StatefulWidget {
  const BillsOverview({Key key}) : super(key: key);

  @override
  _BillsOverviewState createState() => _BillsOverviewState();
}

class _BillsOverviewState extends State<BillsOverview> {
  @override
  Widget build(BuildContext context) {
    var list = context.read<ReallyProvider>();
    return Container(
      color: Colors.grey,
      child: Column(
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Bills',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '\$ 1,810.09',
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 5,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: list.colorsTwo),
                ),
              ),
            ],
          ),
          ListView.builder(
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount:
                  list.billsList.length == null ? 0 : list.billsList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    height: 90,
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 5,
                              height: 60,
                              color: list.colorsTwo[index],
                            ),
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text('${list.billsList[index]}'),
                                  Text('${list.billsDate[index]}'),
                                ],
                              ),
                            Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Text('-\$${list.billsAmount[index]}'),
                            ),
                              Icon(Icons.list),

                            ],
                          ),
                        ],
                      ),
                    ),
                  );
              })
        ],
      ),
    );
  }
}
