import 'package:flutter/material.dart';
import 'package:miskapp/Driver/forPastOrder/past_of_order_tile.dart';
import 'package:miskapp/module/new_order.dart';
import 'package:miskapp/module/user.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';

class ListOfPastOrdersDriver extends StatefulWidget {
  @override
  _ListOfPastOrdersDriverState createState() => _ListOfPastOrdersDriverState();
}

class _ListOfPastOrdersDriverState extends State<ListOfPastOrdersDriver> {
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
                      newOrder[index].tikeIt &&
                      newOrder[index].driveIt == true &&
                      newOrder[index].driverId == user.uid
                  ? PastOrderTileDriver(
                      order: newOrder[index],
                    )
                  : Container();
            },
          );
        });
  }
}
