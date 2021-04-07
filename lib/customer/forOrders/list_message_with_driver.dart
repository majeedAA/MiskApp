import 'package:flutter/material.dart';
import 'package:miskapp/market/forNewOrder/message_tile_market.dart';
import 'package:miskapp/module/chat.dart';
import 'package:miskapp/module/new_order.dart';
import 'package:miskapp/module/user.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';

class ListMessageWithDriver extends StatefulWidget {
  NewOrder order;
  ListMessageWithDriver({this.order});
  @override
  _ListMessageWithDriverState createState() => _ListMessageWithDriverState();
}

class _ListMessageWithDriverState extends State<ListMessageWithDriver> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final chat = Provider.of<List<Chat>>(context) ?? [];
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: chat.length,
            itemBuilder: (conbtext, index) {
              return chat[index].orderId == widget.order.idOfOrder
                  ? chat[index].sender == widget.order.driverId ||
                          chat[index].sender == user.uid
                      ? chat[index].receiver == widget.order.driverId ||
                              chat[index].receiver == user.uid
                          ? MessageTileMarket(
                              message: chat[index],
                            )
                          : Container()
                      : Container()
                  : Container();
            },
          );
        });
  }
}
