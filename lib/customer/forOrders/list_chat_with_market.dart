import 'package:flutter/material.dart';
import 'package:miskapp/market/forNewOrder/message_tile_market.dart';
import 'package:miskapp/module/chat.dart';
import 'package:miskapp/module/new_order.dart';
import 'package:miskapp/module/user.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';

class ListMessageWithMarket extends StatefulWidget {
  NewOrder order;
  ListMessageWithMarket({this.order});
  @override
  _ListMessageWithMarketState createState() => _ListMessageWithMarketState();
}

class _ListMessageWithMarketState extends State<ListMessageWithMarket> {
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
                  ? chat[index].sender == widget.order.marketId ||
                          chat[index].sender == user.uid
                      ? chat[index].receiver == widget.order.marketId ||
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
