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
      color: Color.fromRGBO(49, 50, 55, 1),
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
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 90,
                  child: Card(
                    color: Color.fromRGBO(49, 50, 55, 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    '${list.billsList[index]}',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                                Text(
                                  '${list.billsDate[index]}',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                '-\$${list.billsAmount[index]}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30),
                              ),
                            ),
                            Icon(
                              Icons.list,
                              color: Colors.white,
                              size: 25,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
          ElevatedButton(
            onPressed: () {},
            child: Text('SEE ALL', style: TextStyle(color: Colors.greenAccent)),
            style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(49, 50, 55, 1)),
          )
        ],
      ),
    );
  }
}
