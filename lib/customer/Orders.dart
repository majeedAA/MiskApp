import 'package:flutter/material.dart';
import 'buttonB.dart';
import 'theOrdersProcess.dart';

class Order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Orders',
          style: TextStyle(color: Color(0xffffffff)),
        ),
        backgroundColor: Color(0xffbabbbb),
      ),
      body: ListView(
        children: <Widget>[
          TheOrdersProcess(
            marketName: 'Tamimi',
          ),
        ],
      ),
      //  bottomNavigationBar: new Boutton()
    );
  }
}
