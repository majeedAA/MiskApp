import 'package:flutter/material.dart';
import 'package:miskapp/admin/process/market_tile.dart';
import 'package:miskapp/module/item.dart';
import 'package:miskapp/module/user.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';

class ListOfMarketOfAdmin extends StatefulWidget {
  @override
  _ListOfMarketOfAdminState createState() => _ListOfMarketOfAdminState();
}

class _ListOfMarketOfAdminState extends State<ListOfMarketOfAdmin> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final market = Provider.of<List<Item>>(context) ?? [];
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: market.length,
            itemBuilder: (conbtext, index) {
              return market[index].isMarket
                  ? MarketTileOfAdmin(market: market[index])
                  : Container();
            },
          );
        });
  }
}
