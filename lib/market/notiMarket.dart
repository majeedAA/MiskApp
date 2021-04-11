import 'package:flutter/material.dart';
import 'package:miskapp/market/forNewOrder/list_of_bast_order.dart';
import 'package:miskapp/module/new_order.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';

class NotiMarket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Notification();
  }
}

class Notification extends StatefulWidget {
  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<NewOrder>>.value(
        value: DatabaseService().newOrder,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Past orders',
                style: TextStyle(color: Color(0xffffffff)),
              ),
              backgroundColor: Color(0xff4a6fa5),
            ),
            body: ListOfLastOrderMarket(),
          );
        });
  }
}
