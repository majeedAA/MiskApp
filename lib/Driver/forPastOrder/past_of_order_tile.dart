import 'dart:math';

import 'package:flutter/material.dart';
import 'package:miskapp/Driver/forCurruntPage/page_of_odrer.dart';
import 'package:miskapp/module/item.dart';
import 'package:miskapp/module/new_order.dart';
import 'package:miskapp/module/user.dart';
import 'package:provider/provider.dart';

class PastOrderTileDriver extends StatefulWidget {
  final NewOrder order;
  PastOrderTileDriver({this.order});

  @override
  _PastOrderTileDriverState createState() => _PastOrderTileDriverState();
}

class _PastOrderTileDriverState extends State<PastOrderTileDriver> {
  String cusrmerID;
  String nemeOfMarket;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final users = Provider.of<List<Item>>(context) ?? [];
    Item customer;
    Item market;
    Item driver;

    for (var i = 0; i < users.length; i++) {
      if (users[i].id == user.uid) {
        driver = users[i];
      }

      if (users[i].id == widget.order.marketId) {
        market = users[i];
      }
      if (users[i].id == widget.order.customerId) {
        customer = users[i];
      }
    }
    double dinsToMarket = 0;

    dinsToMarket = (((driver.latitude - market.latitude) *
            (driver.latitude - market.latitude)) +
        ((driver.longitude - market.longitude) *
            (driver.longitude - market.longitude)));

    dinsToMarket = sqrt(dinsToMarket);
    dinsToMarket = (dinsToMarket * 100);
    String dinsToMa = dinsToMarket.toStringAsFixed(1);

    dinsToMarket = (((customer.latitude - market.latitude) *
            (customer.latitude - market.latitude)) +
        ((customer.longitude - market.longitude) *
            (customer.longitude - market.longitude)));

    dinsToMarket = sqrt(dinsToMarket);
    dinsToMarket = (dinsToMarket * 100);
    String dinsToCus = dinsToMarket.toStringAsFixed(1);
    double total = (dinsToMarket * 3).roundToDouble();

    cusrmerID =
        widget.order.customerId.substring(widget.order.customerId.length - 6);
    return Container(
      color: widget.order.state
          ? widget.order.tikeIt
              ? Colors.green
              : Colors.red
          : Colors.red,
      height: 130,
      padding: const EdgeInsets.only(top: 8.0),
      margin: EdgeInsets.only(bottom: 5),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => PageOfOrderDriver(
                    order: widget.order,
                    customer: customer,
                    market: market,
                    total: total)),
          );
        },
        child: Card(
          color: Colors.cyan[50],
          margin: EdgeInsets.fromLTRB(10.0, 7.0, 10.0, 7.0),
          child: Column(
            children: [
              ListTile(
                title: Text('New order from ${market.name}'),
                subtitle: Text('$dinsToMa Km  + $dinsToCus Km\n $total SAR'),
              ),
              Row(
                children: [
                  Visibility(
                    visible: widget.order.tikeIt,
                    child: FlatButton.icon(
                        onPressed: () async {
                          // await DatabaseService().updateAcceptOfOrder(
                          //     widget.order.idOfOrder, widget.order.accept);
                        },
                        icon: Icon(
                          Icons.location_on,
                          color: Colors.cyan[600],
                        ),
                        label: Text('Market')),
                  ),
                  SizedBox(
                    width: 130,
                  ),
                  Visibility(
                    visible: widget.order.tikeIt,
                    child: FlatButton.icon(
                        onPressed: () async {
                          // await DatabaseService().updateStateOfOrder(
                          //     widget.order.idOfOrder, widget.order.state);
                        },
                        icon: Icon(Icons.location_on_outlined,
                            color: Colors.cyan[600]),
                        label: Text('Customer')),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
