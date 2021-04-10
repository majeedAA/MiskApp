import 'package:flutter/material.dart';
import 'package:miskapp/module/new_order.dart';

class BastOrderOfMarket extends StatelessWidget {
  final NewOrder order;
  BastOrderOfMarket({this.order});
  @override
  Widget build(BuildContext context) {
    String driveIt = order.driveIt ? 'Delivery' : 'PickUp';
    String cusrmerID = order.customerId.substring(order.customerId.length - 6);
    return Container(
      color: Colors.red[300],
      height: 130,
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        color: Colors.red[50],
        margin: EdgeInsets.fromLTRB(10.0, 7.0, 10.0, 7.0),
        child: Column(
          children: [
            ListTile(
              title: Text('Past order by $cusrmerID'),
              subtitle: Text('${order.total}SAR \n$driveIt ${order.time} '),
            ),
          ],
        ),
      ),
    );
  }
}
