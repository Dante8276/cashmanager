import 'package:flutter/foundation.dart';
import 'transaction.dart';
import 'package:provider/provider.dart';
import 'dart:collection';

class TransactionData extends ChangeNotifier {
  List<Transaction> transactions = [
    Transaction(reason: 'aaaaa', money: 20),
    Transaction(reason: 'adada', money: 10),
    Transaction(reason: 'yoyoyo', money: 0),
  ];

  int get transactionCount {
    return transactions.length;
  }

  void addTransaction(String r, int money) {
    final transaction = Transaction(reason: r, money: money);
    transactions.add(transaction);
    notifyListeners();
  }

  void deleteTransaction(Transaction transaction) {
    transactions.remove(transaction);
    notifyListeners();
  }
}
