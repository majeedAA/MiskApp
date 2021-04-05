import 'package:flutter/material.dart';
import 'package:miskapp/module/new_order.dart';

class DitilsOfOrder extends StatefulWidget {
  final NewOrder order;
  final double total;
  DitilsOfOrder({this.order, this.total});

  @override
  _DitilsOfOrderState createState() => _DitilsOfOrderState();
}

class _DitilsOfOrderState extends State<DitilsOfOrder> {
  @override
  Widget build(BuildContext context) {
    double withoutCost = widget.order.total - widget.total;
    return Container(
      color: Colors.cyan[50],
      height: 149,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  '  Total:  ',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.blueGrey[700]),
                ),
                Text(
                  '$withoutCost + ${widget.total} =',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
                Text(
                  widget.order.total.toString(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  widget.order.pay,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: TextFormField(
                maxLines: 2,
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'customer\'s notes: \n' + widget.order.notis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
