import 'package:flutter/material.dart';
import 'package:miskapp/customer/processCus/item_info.dart';
import 'package:miskapp/market/process/item_tile.dart';
import 'package:miskapp/module/menu.dart';
import 'package:provider/provider.dart';

class ListOfItemMarket extends StatefulWidget {
  final String idMarket;
  ListOfItemMarket({this.idMarket});
  @override
  _ListOfItemMarketState createState() => _ListOfItemMarketState(idMarket);
}

class _ListOfItemMarketState extends State<ListOfItemMarket> {
  final String idMarket;
  _ListOfItemMarketState(this.idMarket);

  @override
  Widget build(BuildContext context) {
    final menu = Provider.of<List<Menu>>(context) ?? [];

    return ListView.builder(
      itemCount: menu.length,
      itemBuilder: (context, index) {
        return idMarket == menu[index].id
            ? ItemInfo(menu: menu[index])
            : Container();
      },
    );
  }
}
