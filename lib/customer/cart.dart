import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: TextStyle(color: Color(0xffffffff)),
        ),
        backgroundColor: Color(0xffbabbbb),
      ),
      body: Container(
        child: FlatButton.icon(
          icon: Icon(Icons.ac_unit),
          label: Text('papapap'),
          onPressed: () {
            print('hi');
          },
        ),
      ),
    );
  }
}
