import 'dart:math';

import 'package:flutter/material.dart';
import 'package:miskapp/Driver/forCurruntPage/page_of_odrer.dart';
import 'package:miskapp/module/item.dart';
import 'package:miskapp/module/new_order.dart';
import 'package:miskapp/module/user.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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

    double customerLati = 0;
    double customerlong = 0;
    double driverLati = 0;
    double driverlong = 0;
    double marketLati = 0;
    double marketlong = 0;
    String marketName = '';

    for (var i = 0; i < users.length; i++) {
      if (users[i].id == user.uid) {
        driverLati = users[i].latitude;
        driverlong = users[i].longitude;
      }

      if (users[i].id == widget.order.marketId) {
        market = users[i];
        marketLati = users[i].latitude;
        marketlong = users[i].longitude;
        marketName = users[i].name;
      }
      if (users[i].id == widget.order.customerId) {
        customer = users[i];
        customerLati = users[i].latitude;
        customerlong = users[i].longitude;
      }
    }
    double dinsToMarket = 0;

    dinsToMarket = (((driverLati - marketLati) * (driverLati - marketLati)) +
        ((driverlong - marketlong) * (driverlong - marketlong)));

    dinsToMarket = sqrt(dinsToMarket);
    dinsToMarket = (dinsToMarket * 100);
    String dinsToMa = dinsToMarket.toStringAsFixed(1);

    dinsToMarket =
        (((customerLati - marketLati) * (customerLati - marketLati)) +
            ((customerlong - marketlong) * (customerlong - marketlong)));

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
                title: Text('New order from $marketName'),
                subtitle: Text('$dinsToMa Km  + $dinsToCus Km\n $total SAR'),
              ),
              Row(
                children: [
                  Visibility(
                    visible: widget.order.tikeIt,
                    child: FlatButton.icon(
                        onPressed: () async {
                          var mapSchema =
                              'geo:${market.latitude},${market.longitude}';
                          if (await canLaunch(mapSchema)) {
                            await launch(mapSchema);
                          } else {
                            throw 'Could not launch $mapSchema';
                          }
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
