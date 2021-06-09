import 'package:flutter/material.dart';
import 'package:flutter_ui_rally/provider/provider_data.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

class BillsPage extends StatefulWidget {
  const BillsPage({Key key}) : super(key: key);

  @override
  _BillsPageState createState() => _BillsPageState();
}

class _BillsPageState extends State<BillsPage> {
  @override
  Widget build(BuildContext context) {
    var list = context.read<ReallyProvider>();
    var chart = PieChart(
      dataMap: list.bills,
      animationDuration: Duration(milliseconds: 4000),
      chartLegendSpacing: 16.0,
      chartRadius: MediaQuery.of(context).size.width / 1.2,
      colorList: list.colorsTwo,
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      ringStrokeWidth: 8,
      legendOptions: LegendOptions(
        showLegendsInRow: false,
        showLegends: false,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValuesOutside: true,
        showChartValueBackground: true,
        showChartValues: false,
        showChartValuesInPercentage: false,
        decimalPlaces: 2,
      ),
    );
    return Container(
      color: Color.fromRGBO(49, 50, 55, 1),
      child: SizedBox(
        height: 600,
        child: ListView(children: [
            Column(
              children: [
                Center(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Container(
                            child: chart),
                      ),
                      Positioned(
                        top: 170,
                        left: 185,
                        child: Container(
                          child: Text(
                            'Due',
                            style: TextStyle(fontSize: 22, color: Colors.white),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 200,
                        left: 105,
                        child: Container(
                          child: Text(
                            '1,810.09',
                            style: TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ListView.builder(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: list.billsList == null ? 0 : list.billsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return new GestureDetector(
                    //You need to make my child interactive
                    child: Container(
                      height: 90,
                      child: new Card(
                        //I am the clickable child
                        color: Color.fromRGBO(49, 50, 55, 1),
                        margin: EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, top: 10.0, bottom: 10.0),
                              child: Container(
                                color: list.colorsTwo[index],
                                width: 5,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20.0, right: 150.0),
                              child: Column(
                                children: [
                                  Text(
                                    "${list.billsList[index]}",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 7.0),
                                    child: Text(
                                      "${list.billsDate[index]}",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 1.0),
                              child: Text(
                                "-\$ ${list.billsAmount[index]}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 1.0),
                              child: Tab(
                                icon: Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ]),
      ),
    );

  }
}
