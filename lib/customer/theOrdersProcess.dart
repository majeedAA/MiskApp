import 'dart:ffi';

import 'package:flutter/material.dart';

class TheOrdersProcess extends StatelessWidget {

  TheOrdersProcess({this.marketName});

  final String marketName;



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.0,
      child: Column(
        children: [
          Text(marketName,
            style: TextStyle(
              color: Color(0xff0096c7),
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),


        ],
      ),
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Color(0xffcaf0f8),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
