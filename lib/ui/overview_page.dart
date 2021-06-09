import 'package:flutter/material.dart';
import 'package:flutter_ui_rally/ui/overview_datail/AlertsOverview.dart';
import 'package:flutter_ui_rally/ui/overview_datail/account_overview.dart';
import 'package:flutter_ui_rally/ui/overview_datail/bills_overview.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({Key key}) : super(key: key);

  @override
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: [
            AlertsOverview(),
          ],
      ),
    );
  }
}
