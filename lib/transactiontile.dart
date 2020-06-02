import 'package:flutter/material.dart';

class Transactiontile extends StatelessWidget {
  final String reason;
  final int money;
  Transactiontile({this.reason, this.money});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Container(
        color: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            reason,
            style: TextStyle(
              fontSize: 30,
              color: Colors.purple,
            ),
          ),
        ),
      ),
      leading: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Rs ' + money.toString(),
            style: TextStyle(
              fontSize: 30,
              color: Colors.purple,
            ),
          ),
        ),
      ),
    );
  }
}
