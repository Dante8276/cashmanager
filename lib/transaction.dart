import 'package:flutter/material.dart';

class Transaction {
  final String reason;
  int money;
  Transaction({this.reason, this.money});
}

List<String> categories = [
  'Food',
  'Travel',
  'Bills',
  'Clothes',
  'Fees',
  'Other',
];

List<int> categorycount = [1, 2, 3, 0, 5, 6];
List<MaterialColor> categorycolor = [
  Colors.purple,
  Colors.green,
  Colors.blue,
  Colors.red,
  Colors.yellow,
  Colors.deepOrange,
];
