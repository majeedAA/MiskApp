import 'package:flutter/material.dart';
import 'package:miskapp/customer/forOrders/order_tile_customer.dart';
import 'package:miskapp/module/new_order.dart';
import 'package:miskapp/module/user.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';

class ListOfOrdersCustomer extends StatefulWidget {
  @override
  _ListOfOrdersCustomerState createState() => _ListOfOrdersCustomerState();
}

class _ListOfOrdersCustomerState extends State<ListOfOrdersCustomer> {
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
              return newOrder[index].customerId == user.uid
                  ? OrdersOfCustomer(
                      order: newOrder[index],
                    )
                  : Container();
            },
          );
        });
  }
}
