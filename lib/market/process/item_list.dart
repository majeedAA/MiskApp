import 'package:flutter/material.dart';
import 'package:miskapp/market/process/item_tile.dart';
import 'package:miskapp/module/menu.dart';
import 'package:miskapp/module/user.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';

class ListOfItem extends StatefulWidget {
  @override
  _ListOfItemState createState() => _ListOfItemState();
}

class _ListOfItemState extends State<ListOfItem> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    final menu = Provider.of<List<Menu>>(context) ?? [];
    // menu.forEach((menu) {
    //   print(menu.id);
    //   // print(menu.caticury);
    //   // print(menu.price);
    //   // print(menu.unit);
    // });
    //print(user.uid);
    return ListView.builder(
      itemCount: menu.length,
      itemBuilder: (context, index) {
        return user.uid == menu[index].id
            ? MenuTile(menu: menu[index])
            : Container();
      },
    );
  }
}
