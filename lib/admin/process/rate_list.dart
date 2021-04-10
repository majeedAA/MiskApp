import 'package:flutter/material.dart';
import 'package:miskapp/admin/process/list_of_rate.dart';
import 'package:miskapp/module/rate.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';

class PageOfRateAdmin extends StatefulWidget {
  @override
  _PageOfRateAdminState createState() => _PageOfRateAdminState();
}

class _PageOfRateAdminState extends State<PageOfRateAdmin> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Rate>>.value(
        value: DatabaseService().rate,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'All Rate',
                style: TextStyle(color: Color(0xffffffff)),
              ),
              backgroundColor: Color(0xff4a6fa5),
            ),
            body: ListOfRateAdmin(),
          );
        });
  }
}
