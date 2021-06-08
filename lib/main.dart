import 'package:flutter/material.dart';
import 'package:flutter_ui_rally/ui/accounts_page.dart';
import 'package:flutter_ui_rally/ui/home.dart';
import 'package:flutter_ui_rally/provider/provider_data.dart';
import 'package:flutter_ui_rally/ui/bills_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ReallyProvider>(
              create: (_) => ReallyProvider()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: AccountsPage(),
        ));
  }
}
