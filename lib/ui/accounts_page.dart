import 'package:flutter/material.dart';
import 'package:flutter_ui_rally/provider/provider_data.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

class AccountsPage extends StatefulWidget {
  const AccountsPage({Key key}) : super(key: key);

  @override
  _AccountsPageState createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  @override
  Widget build(BuildContext context) {
    var list = context.read<ReallyProvider>();

    var chart = PieChart(
      dataMap: list.accounts,
      animationDuration: Duration(milliseconds: 4000),
      chartLegendSpacing: 16.0,
      chartRadius: MediaQuery.of(context).size.width / 1.2,
      colorList: list.colors,
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
    return Scaffold(
      backgroundColor: Colors.white10,
      body: ListView(children: [
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
                        'Total',
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 200,
                    left: 105,
                    child: Container(
                      child: Text(
                        '12,132.49',
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
            itemCount: list.accountList == null ? 0 : list.accountList.length,
            itemBuilder: (BuildContext context, int index) {
              return new GestureDetector(
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
                            color: list.colors[index],
                            width: 5,
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(top: 20.0, right: 150.0),
                          child: Column(
                            children: [
                              Text(
                                "${list.accountList[index]}",
                                style: TextStyle(color: Colors.white),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 7.0),
                                child: Text(
                                  "${list.accountCard[index]}",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 1.0),
                          child: Text(
                            "\$ ${list.accountAmount[index]}",
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
    );
  }
}
