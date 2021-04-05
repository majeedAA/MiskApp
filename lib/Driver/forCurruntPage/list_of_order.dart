import 'package:flutter/material.dart';
import 'package:miskapp/Driver/forCurruntPage//new_order_tile.dart';
import 'package:miskapp/module/new_order.dart';
import 'package:miskapp/module/user.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';

class ListOfCurruntOrdersDriver extends StatefulWidget {
  @override
  _ListOfCurruntOrdersDriverState createState() =>
      _ListOfCurruntOrdersDriverState();
}

class _ListOfCurruntOrdersDriverState extends State<ListOfCurruntOrdersDriver> {
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
              return newOrder[index].toDriver &&
                      newOrder[index].toDriver &&
                      newOrder[index].driveIt == true &&
                      !newOrder[index].tikeIt
                  ? NewOrderDriverTile(
                      order: newOrder[index],
                    )
                  : Container();
            },
          );
        });
  }
}
