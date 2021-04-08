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
    // print(widget.order.allOrder);
    final double y = widget.order.allOrder.length / 4;

    return ListView(
      children: List.generate(y.round(), (index) {
        return Container(
          height: 60,
          color: Colors.grey[50],
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: GestureDetector(
              child: Text(
                'Item: ${widget.order.allOrder[index]}\nQuantity( ${widget.order.allOrder[index + 6]} )\nTotal price( ${widget.order.allOrder[index + 9]} )',
                style: TextStyle(
                  fontSize: 15,
                  // fontWeight: FontWeight.,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
