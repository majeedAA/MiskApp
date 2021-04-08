import 'package:flutter/material.dart';
import 'package:miskapp/Driver/forPastOrder/list_of_current_order.dart';
import 'package:miskapp/module/chat.dart';
import 'package:miskapp/module/item.dart';
import 'package:miskapp/module/new_order.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';

class CurrentOrders extends StatelessWidget {
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
                  'Current order',
                  style: TextStyle(color: Color(0xffffffff)),
                ),
                backgroundColor: Colors.blue[300],
              ),
              backgroundColor: Colors.blue[50],
              body: ListOfCurrentOrdersDriver(),
            );
          },
        ),
      ),
    );
  }
}
