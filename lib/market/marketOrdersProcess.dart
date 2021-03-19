import 'package:flutter/material.dart';

class OrderProcess extends StatelessWidget {
  OrderProcess({this.customerName, this.orderID,this.state});

  MaterialColor accepte = Colors.green;
  MaterialColor reject = Colors.red;

  final String customerName;
  final int orderID;
  final bool state;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Row(
            children: [
              Container(
                height: 65.0,
                width: 260,
                child: Center(
                  child: Text(
                    '$customerName this order number $orderID',
                    style: TextStyle(
                      color: Color(0xff0096c7),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                margin: EdgeInsets.only(top: 15.0, bottom: 15,right: 7,left: 15),
                decoration: BoxDecoration(
                  color: Color(0xffcaf0f8),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              Container(
                height: 65.0,
                width: 65,
                child: Center(child: Text (state == true ? 'Done':'reject')),
                margin: EdgeInsets.only(top: 15.0, bottom: 15,right: 15,left: 7),
                decoration: BoxDecoration(
                  color: state ? accepte : reject,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
