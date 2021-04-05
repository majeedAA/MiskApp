import 'package:flutter/material.dart';
import 'package:miskapp/customer/cart/list_of_item.dart';
import 'package:miskapp/customer/cart/pill.dart';
import 'package:miskapp/module/card.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  final List<String> pays = [
    'cash',
    'mada',
    'appel Pay',
    'Visa',
  ];
  dynamic total = 0;
  String pay;
  String notis;
  String coupon;
  String time;
  bool driveIt = false;
  Color ava = Colors.green[300];
  Color non = Colors.grey[500];

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Cardd>>.value(
        value: DatabaseService().cards,
        builder: (context, snapshot) {
          return MaterialApp(
            home: DefaultTabController(
              length: 1,
              child: Scaffold(
                appBar: AppBar(
                  title: Text(
                    'Cart',
                    style: TextStyle(color: Color(0xffffffff)),
                  ),
                  backgroundColor: Color(0xff4a6fa5),
                ),
                body: SafeArea(
                  child: Column(
                    children: <Widget>[
                      Container(
                        color: Color(0xffedf2fb),
                        height: MediaQuery.of(context).size.height / 1.66,
                        child: CardList(),
                      ),
                      Pill(),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
