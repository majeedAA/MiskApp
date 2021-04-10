import 'package:flutter/material.dart';
import 'package:miskapp/module/rate.dart';

class AllRateTile extends StatefulWidget {
  final Rate rate;
  AllRateTile({this.rate});
  @override
  _AllRateTileState createState() => _AllRateTileState();
}

class _AllRateTileState extends State<AllRateTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          title: Text(widget.rate.rateId),
          subtitle: Text(
              'Customer rate: ${widget.rate.marketRateCustomer} + ${widget.rate.drivrtRateCustomer}\nMarket rate: ${widget.rate.customerRateMarket}\nDriver rate: ${widget.rate.customerRateDriver}'),
        ),
      ),
    );
  }
}
