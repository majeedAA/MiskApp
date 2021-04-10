import 'package:flutter/material.dart';
import 'package:miskapp/market/bast_order.dart';
import 'package:miskapp/module/new_order.dart';
import 'package:miskapp/module/user.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';

class ListOfLastOrderMarket extends StatefulWidget {
  @override
  _ListOfLastOrderMarketState createState() => _ListOfLastOrderMarketState();
}

class _ListOfLastOrderMarketState extends State<ListOfLastOrderMarket> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final newOrder = Provider.of<List<NewOrder>>(context) ?? [];

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: newOrder.length,
            itemBuilder: (conbtext, index) {
              return newOrder[index].marketId == user.uid
                  ? !newOrder[index].state || newOrder[index].tikeIt
                      ? BastOrderOfMarket(
                          order: newOrder[index],
                        )
                      : Container()
                  : Container();
            },
          );
        });
  }
}
