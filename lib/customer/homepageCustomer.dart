// import 'dart:html';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miskapp/customer/cart.dart';
import 'package:miskapp/customer/processCus/listOfMarket.dart';
import 'package:miskapp/module/item.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';
import 'Resuble_card.dart';
import 'buttonB.dart';

class Login extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Item>>.value(
        value: DatabaseService().items,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.shopping_bag),
                  label: Text(''),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Cart()),
                    );
                  },
                )
              ],
              title: Text(
                'MISK Customer Login',
                style: TextStyle(color: Color(0xffffffff)),
              ),
              backgroundColor: Color(0xffbabbbb),
            ),
            body: ListOfMarket(),
          );
        });
  }
}
