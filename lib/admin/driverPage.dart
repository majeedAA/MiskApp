import 'package:flutter/material.dart';
import 'package:miskapp/admin/process/list_of_drivers.dart';
import 'package:miskapp/module/item.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';

class DriverPageOfAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Item>>.value(
        value: DatabaseService().items,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              actions: <Widget>[],
              title: Text(
                'Driver\'s page',
                style: TextStyle(color: Color(0xffffffff)),
              ),
              backgroundColor: Color(0xff4a6fa5),
            ),
            backgroundColor: Colors.blue[50],
            body: ListOfDriverAdmin(),
          );
        });
  }
}
