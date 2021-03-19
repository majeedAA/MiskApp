import 'package:flutter/material.dart';
class TheProcess extends StatelessWidget {

  dynamic icons;
  String name;

  TheProcess({this.icons, this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 3),
      child: Column(
        children: <Widget>[
          Icon(
            icons,
            size: 40,
            color: Color(0xff343a40),

          ),
          Text(
            name,
            style: TextStyle(
              color: Colors.black,
            ),
          ),

        ],
      ),

      );


  }
}
