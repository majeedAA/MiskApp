import 'package:flutter/material.dart';
import 'package:miskapp/module/new_order.dart';

class ForLoopOrders extends StatelessWidget {
  NewOrder order;
  ForLoopOrders({this.order});

  @override
  Widget build(BuildContext context) {
    int yx = 0;

    final double y = order.allOrder.length / 4;
    return ListView(
      children: List.generate(y.round(), (index) {
        return Container(
          height: 60,
          color: Colors.grey[50],
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: Text(
              'Item: ${order.allOrder[yx]}\nQuantity( ${order.allOrder[yx + 2]} )\nTotal price( ${order.allOrder[yx + 3]} )',
              style: TextStyle(
                fontSize: 15,
                // fontWeight: FontWeight.,
              ),
            ),
          ),
        );
      }),
    );
  }
}
