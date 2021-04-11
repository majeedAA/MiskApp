import 'package:flutter/material.dart';
import 'package:miskapp/Driver/forPastOrder/list_of_past_order.dart';
import 'package:miskapp/module/chat.dart';
import 'package:miskapp/module/item.dart';
import 'package:miskapp/module/new_order.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';

class PastOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<NewOrder>>.value(
      value: DatabaseService().newOrder,
      child: StreamProvider<List<Item>>.value(
        value: DatabaseService().items,
        child: StreamProvider<List<Chat>>.value(
          value: DatabaseService().chats,
          builder: (context, snapshot) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Past order',
                  style: TextStyle(color: Color(0xffffffff)),
                ),
                backgroundColor: Color(0xff4a6fa5),
              ),
              backgroundColor: Colors.blue[50],
              body: ListOfPastOrderDriver(),
            );
          },
        ),
      ),
    );
  }
}
