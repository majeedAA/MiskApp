import 'package:flutter/material.dart';
import 'package:miskapp/module/new_order.dart';

class ForLoopOrders extends StatefulWidget {
  NewOrder order;
  ForLoopOrders({this.order});

  @override
  _ForLoopOrdersState createState() => _ForLoopOrdersState();
}

class _ForLoopOrdersState extends State<ForLoopOrders> {
  @override
  Widget build(BuildContext context) {
    final double y = widget.order.allOrder.length / 4;
    int z = y.round();

    return ListView(
      children: List.generate(z, (index) {
        return Container(
          height: 60,
          color: Colors.grey[50],
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: GestureDetector(
              child: Text(
                'Item: ${widget.order.allOrder[index]}\nQuantity( ${widget.order.allOrder[index + (z * 2)]} )\nTotal price( ${widget.order.allOrder[index + (z * 3)]} )',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
