import 'package:flutter/material.dart';
import 'package:miskapp/module/chat.dart';
import 'package:miskapp/module/user.dart';
import 'package:provider/provider.dart';

class MessageTileMarket extends StatefulWidget {
  final Chat message;
  MessageTileMarket({this.message});
  @override
  _MessageTileMarketState createState() => _MessageTileMarketState();
}

class _MessageTileMarketState extends State<MessageTileMarket> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Container(
      padding: EdgeInsets.all(1),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      // height: 10,

      child: Container(
        margin: EdgeInsets.all(5),
        child: Text(
          widget.message.message,
          style: TextStyle(fontSize: 17),
          textDirection: widget.message.sender == user.uid
              ? TextDirection.rtl
              : TextDirection.ltr,
        ),
      ),
    );
  }
}
