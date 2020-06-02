import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cashmanager/transactiondata.dart';
import 'transaction.dart';

class Addtransaction extends StatefulWidget {
  @override
  _AddtransactionState createState() => _AddtransactionState();
}

class _AddtransactionState extends State<Addtransaction> {
  String dropdownValue = 'Add';
  String dropdowncat = 'Food';

  @override
  Widget build(BuildContext context) {
    String reason;
    int money;
    return Theme(
      data: new ThemeData(
          primaryColor: Colors.purple,
          accentColor: Colors.purple,
          hintColor: Colors.grey),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff292929),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              Text(
                'Add Transaction',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 40,
                ),
              ),
              DropdownButton(
                style: TextStyle(color: Colors.purple),
                value: dropdownValue,
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: <String>['Add', 'Remove']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              TextField(
                style: TextStyle(color: Colors.purple),
                decoration: InputDecoration(labelText: 'Reason'),
                onChanged: (value) {
                  reason = value;
                },
              ),
              TextField(
                style: TextStyle(color: Colors.purple),
                decoration: InputDecoration(labelText: 'Money'),
                onChanged: (value) {
                  money = int.parse(value);
                },
              ),
              Container(
                width: 300,
                child: DropdownButton(
                  isExpanded: true,
                  style: TextStyle(color: Colors.purple),
                  value: dropdowncat,
                  onChanged: (String newValue) {
                    setState(() {
                      dropdowncat = newValue;
                    });
                  },
                  items:
                      categories.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              FlatButton(
                onPressed: () {
                  categorycount[categories.indexOf(dropdowncat)] += money;
                  print(categorycount[categories.indexOf(dropdowncat)]);
                  Provider.of<TransactionData>(context)
                      .addTransaction(reason, money);
                  Navigator.pop(context);
                },
                child: Text('Add'),
                color: Colors.purple,
              )
            ],
          ),
        ),
      ),
    );
  }
}
