import 'package:flutter/material.dart';
import 'package:miskapp/customer/forOrders/list_of_order_customer.dart';
import 'package:miskapp/module/item.dart';
import 'package:miskapp/module/new_order.dart';
import 'package:miskapp/module/user.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';
import 'theOrdersProcess.dart';

class Order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<User>(context);
    return StreamProvider<List<NewOrder>>.value(
      value: DatabaseService().newOrder,
      child: StreamProvider<List<Item>>.value(
          value: DatabaseService().items,
          builder: (context, snapshot) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'MISK Login market',
                  style: TextStyle(color: Color(0xffffffff)),
                ),
                backgroundColor: Color(0xffbabbbb),
              ),
              body: ListOfOrdersCustomer(),
            );
          }),
    );
  }
}
