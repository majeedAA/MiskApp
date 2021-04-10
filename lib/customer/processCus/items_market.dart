import 'package:flutter/material.dart';
import 'package:miskapp/customer/processCus/list_items.dart';
import 'package:miskapp/module/menu.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';

class ItemOfMarket extends StatelessWidget {
  final String idMarket;

  ItemOfMarket({this.idMarket});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Menu>>.value(
      value: DatabaseService().menus,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Market\'s Items',
            style: TextStyle(color: Color(0xffffffff)),
          ),
          backgroundColor: Color(0xffbabbbb),
        ),
        body: ListOfItemMarket(
          idMarket: idMarket,
        ),
      ),
    );
  }
}
