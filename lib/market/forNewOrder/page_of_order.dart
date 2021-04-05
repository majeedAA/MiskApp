import 'package:flutter/material.dart';
import 'package:miskapp/market/forNewOrder/customer_ditils.dart';
import 'package:miskapp/market/forNewOrder/fot_loop_orders.dart';
import 'package:miskapp/module/item.dart';
import 'package:miskapp/module/new_order.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';

class PageOfOrder extends StatelessWidget {
  final NewOrder order;
  final double marketLati;
  final double marketLongi;

  PageOfOrder({this.order, this.marketLati, this.marketLongi});
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Item>>.value(
        value: DatabaseService().items,
        builder: (context, snapshot) {
          return MaterialApp(
            home: DefaultTabController(
              length: 1,
              child: Scaffold(
                backgroundColor: Colors.amber[50],
                appBar: AppBar(
                  actions: [
                    IconButton(
                        icon: Icon(Icons.arrow_forward_ios_rounded),
                        onPressed: () => Navigator.pop(context))
                  ],
                  title: Text(
                    'the Order',
                    style: TextStyle(color: Color(0xffffffff)),
                  ),
                  backgroundColor: Colors.amber[200],
                ),
                body: SafeArea(
                  child: Column(
                    children: <Widget>[
                      CustomerDitils(
                        order: order,
                      ),
                      Container(
                          color: Colors.amber[100],
                          height: MediaQuery.of(context).size.height / 1.215,
                          child: ForLoopOrders(
                            order: order,
                          )),
                      // Container(
                      //   color: Colors.red,
                      //   height: MediaQuery.of(context).size.height / 2.05,
                      //   //child: Chat(),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
