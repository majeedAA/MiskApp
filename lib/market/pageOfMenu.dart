import 'package:flutter/material.dart';
import 'package:miskapp/market/process/item_list.dart';
import 'package:miskapp/market/process/setting_item.dart';
import 'package:miskapp/module/menu.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';

class MenuMarket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Orders();
  }
}

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              height: 1500,
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsItem(),
            );
          });
    }

    return StreamProvider<List<Menu>>.value(
      value: DatabaseService().menus,
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.add_to_photos_rounded),
              label: Text('New Item'),
              onPressed: () => _showSettingsPanel(),
            )
          ],
          title: Text(
            'Menu',
            style: TextStyle(color: Color(0xffffffff)),
          ),
          backgroundColor: Color(0xff4a6fa5),
        ),
        body: ListOfItem(),
      ),
    );
  }
}
