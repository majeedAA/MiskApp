import 'package:flutter/material.dart';
import 'package:miskapp/module/item.dart';
import 'package:miskapp/module/user.dart';
import 'package:provider/provider.dart';

class MarketTile extends StatelessWidget {
  final Item market;
  MarketTile({this.market});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[100],
          ),
          title: Text(market.name),
          subtitle: Text('Takes ${market.phone} Phone'),
        ),
      ),
    );
  }
}
