import 'package:flutter/material.dart';
import 'package:miskapp/customer/processCus/marketTile.dart';
import 'package:miskapp/module/item.dart';
import 'package:miskapp/module/user.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';

class ListOfMarket extends StatefulWidget {
  @override
  _ListOfMarketState createState() => _ListOfMarketState();
}

class _ListOfMarketState extends State<ListOfMarket> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    final market = Provider.of<List<Item>>(context) ?? [];

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          UserData userData = snapshot.data;
          return ListView.builder(
            itemCount: market.length,
            itemBuilder: (conbtext, index) {
              return market[index].isMarket
                  ? market[index].sity == userData.sity
                      ? MarketTile(
                          market: market[index],
                          userLati: userData.latitude,
                          userLongi: userData.longitude,
                        )
                      : Container()
                  : Container();
            },
          );
        });
  }
}
