import 'package:flutter/material.dart';
import 'package:miskapp/market/forNewOrder/new_oredr_tile.dart';
import 'package:miskapp/module/item.dart';
import 'package:miskapp/module/new_order.dart';
import 'package:miskapp/module/user.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';

class ListOfOrdersMarket extends StatefulWidget {
  @override
  _ListOfOrdersMarketState createState() => _ListOfOrdersMarketState();
}

class _ListOfOrdersMarketState extends State<ListOfOrdersMarket> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final newOrder = Provider.of<List<NewOrder>>(context) ?? [];

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          UserData userData = snapshot.data;
          return ListView.builder(
            itemCount: newOrder.length,
            itemBuilder: (conbtext, index) {
              return newOrder[index].marketId == user.uid
                  ? newOrder[index].state
                      ? NewOrderMarketTile(
                          order: newOrder[index],
                          marketLati: userData.latitude,
                          marketLongi: userData.longitude,
                        )
                      : Container()
                  : Container();
            },
          );
        });
  }
}
