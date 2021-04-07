import 'package:flutter/material.dart';
import 'package:miskapp/module/new_order.dart';

class ForLoopOrders extends StatefulWidget {
  NewOrder order;
  ForLoopOrders({this.order});

  @override
  _ForLoopOrdersState createState() => _ForLoopOrdersState();
}

class _ForLoopOrdersState extends State<ForLoopOrders> {
  int yx = -4;
  @override
  Widget build(BuildContext context) {
    // print(widget.order.allOrder);
    final double y = widget.order.allOrder.length / 4;

    return ListView(
      children: List.generate(y.round(), (index) {
        setState(() {
          this.yx = this.yx + 4;
        });

        return Container(
          height: 60,
          color: Colors.grey[50],
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: GestureDetector(
              child: Text(
                'Item: ${widget.order.allOrder[yx]}\nQuantity( ${widget.order.allOrder[yx + 2]} )\nTotal price( ${widget.order.allOrder[yx + 3]} )',
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
