import 'package:flutter/material.dart';
import 'package:miskapp/module/chat.dart';
import 'package:miskapp/module/user.dart';
import 'package:provider/provider.dart';

class MessageTileDriver extends StatefulWidget {
  final Chat message;
  MessageTileDriver({this.message});
  @override
  _MessageTileDriverState createState() => _MessageTileDriverState();
}

class _MessageTileDriverState extends State<MessageTileDriver> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Container(
      padding: EdgeInsets.all(1),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      // height: 10,

      child: Text(
        widget.message.message,
        style: TextStyle(fontSize: 17),
        textDirection: widget.message.sender == user.uid
            ? TextDirection.rtl
            : TextDirection.ltr,
      ),
    );
  }
}
