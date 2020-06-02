import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cashmanager/transactiondata.dart';
import 'mainscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => TransactionData(),
      child: MaterialApp(
        home: Mainscreen(),
      ),
    );
  }
}
