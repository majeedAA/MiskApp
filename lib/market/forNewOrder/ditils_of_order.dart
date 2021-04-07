import 'package:flutter/material.dart';
import 'package:miskapp/module/new_order.dart';

class DitilsOfOrderMarket extends StatefulWidget {
  final NewOrder order;

  DitilsOfOrderMarket({this.order});
  @override
  _DitilsOfOrderMarketState createState() => _DitilsOfOrderMarketState();
}

class _DitilsOfOrderMarketState extends State<DitilsOfOrderMarket> {
  @override
  Widget build(BuildContext context) {
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
                  ' ${widget.order.total}',
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
