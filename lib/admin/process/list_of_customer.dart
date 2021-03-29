import 'package:flutter/material.dart';
import 'package:miskapp/admin/process/customer_tile.dart';
import 'package:miskapp/module/item.dart';
import 'package:miskapp/module/user.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';

class ListOfCustomer extends StatefulWidget {
  @override
  _ListOfCustomerState createState() => _ListOfCustomerState();
}

class _ListOfCustomerState extends State<ListOfCustomer> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    final customer = Provider.of<List<Item>>(context) ?? [];
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: customer.length,
            itemBuilder: (conbtext, index) {
              return customer[index].isCustomer
                  ? CustomerTile(customer: customer[index])
                  : Container();
            },
          );
        });
  }
}
