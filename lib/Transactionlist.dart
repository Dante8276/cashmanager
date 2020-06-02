import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cashmanager/transactiondata.dart';
import 'package:cashmanager/transactiontile.dart';

class Transactionlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionData>(
      builder: (context, transactiondata, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final transaction = transactiondata.transactions[index];
            return Container(
              child: Transactiontile(
                reason: transaction.reason,
                money: transaction.money,
              ),
            );
          },
          itemCount: transactiondata.transactionCount,
        );
      },
    );
  }
}
