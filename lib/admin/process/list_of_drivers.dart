import 'package:flutter/material.dart';
import 'package:miskapp/admin/process/driver_tail.dart';
import 'package:miskapp/module/item.dart';
import 'package:miskapp/module/user.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';

class ListOfDriverAdmin extends StatefulWidget {
  @override
  _ListOfDriverAdminState createState() => _ListOfDriverAdminState();
}

class _ListOfDriverAdminState extends State<ListOfDriverAdmin> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final driver = Provider.of<List<Item>>(context) ?? [];
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: driver.length,
            itemBuilder: (conbtext, index) {
              return driver[index].isDriver
                  ? DriverTileForAdmin(driver: driver[index])
                  : Container();
            },
          );
        });
  }
}
