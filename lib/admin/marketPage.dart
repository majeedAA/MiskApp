import 'package:flutter/material.dart';
import 'package:miskapp/admin/process/list_of_market.dart';
import 'package:miskapp/module/item.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';

class MarketPageOfAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Item>>.value(
        value: DatabaseService().items,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              actions: <Widget>[],
              title: Text(
                'Page of Market',
                style: TextStyle(color: Color(0xffffffff)),
              ),
              backgroundColor: Colors.blue[300],
            ),
            backgroundColor: Colors.blue[50],
            body: ListOfMarketOfAdmin(),
          );
        });
  }
}
