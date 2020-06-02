import 'package:cashmanager/graph.dart';
import 'package:flutter/material.dart';
import 'addtransaction.dart';
import 'Transactionlist.dart';

class Mainscreen extends StatefulWidget {
  @override
  _MainscreenState createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Color(0xff292929),
          size: 35,
        ),
        backgroundColor: Colors.purple,
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => SingleChildScrollView(
                      child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Addtransaction(),
                  )),
              backgroundColor: Color(0xff757575));
        },
      ),
      backgroundColor: Color(0xff292929),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SafeArea(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    radius: 15,
                    child: Icon(
                      Icons.menu,
                      size: 15,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Creategraph(),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff292929),
              ),
              child: Transactionlist(),
            ),
          ),
        ],
      ),
    );
  }
}
