import 'package:flutter/material.dart';
import 'package:miskapp/market/process/info_list.dart';
import 'package:miskapp/market/process/setting_form.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AccountMarket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().info,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[200],
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('settings'),
              onPressed: () => _showSettingsPanel(),
            )
          ],
        ),
        body: ItemList(),
      ),
    );
  }
}
