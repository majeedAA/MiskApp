import 'package:flutter/material.dart';
import 'package:miskapp/Driver/forCurruntPage/message_tile.dart';
import 'package:miskapp/module/chat.dart';
import 'package:miskapp/module/new_order.dart';
import 'package:miskapp/module/user.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';

class MessageOfDriver extends StatefulWidget {
  NewOrder order;
  MessageOfDriver({this.order});
  @override
  _MessageOfDriverState createState() => _MessageOfDriverState();
}

class _MessageOfDriverState extends State<MessageOfDriver> {
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
              return chat[index].idOfChat == widget.order.idOfOrder &&
                          chat[index].sender == widget.order.customerId ||
                      chat[index].sender == user.uid &&
                          chat[index].receiver == widget.order.customerId ||
                      chat[index].receiver == user.uid
                  ? MessageTileDriver(
                      message: chat[index],
                    )
                  : Container();
            },
          );
        });
  }
}
