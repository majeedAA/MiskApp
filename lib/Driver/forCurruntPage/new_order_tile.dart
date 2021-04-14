import 'dart:math';
import 'package:flutter/material.dart';
import 'package:miskapp/Driver/forCurruntPage/page_of_odrer.dart';
import 'package:miskapp/module/item.dart';
import 'package:miskapp/module/new_order.dart';
import 'package:miskapp/module/user.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NewOrderDriverTile extends StatefulWidget {
  final NewOrder order;
  NewOrderDriverTile({this.order});
  @override
  _NewOrderDriverTileState createState() => _NewOrderDriverTileState();
}

class _NewOrderDriverTileState extends State<NewOrderDriverTile> {
  String cusrmerID;
  String marketName;
  double customerLati;
  double customerLong;
  double marketLati;
  double marketLong;
  double driverLati;
  double driverLong;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final users = Provider.of<List<Item>>(context) ?? [];
    Item customer;
    Item market;
    // Item driver;

    for (var i = 0; i < users.length; i++) {
      if (users[i].id == user.uid) {
        //   driver = users[i];
        driverLati = users[i].latitude;
        driverLong = users[i].longitude;
      }

      if (users[i].id == widget.order.marketId) {
        market = users[i];
        marketLati = users[i].latitude;
        marketLong = users[i].longitude;
        marketName = users[i].name;
      }
      if (users[i].id == widget.order.customerId) {
        customer = users[i];
        customerLati = users[i].latitude;
        customerLong = users[i].longitude;
      }
    }
    double dinsToMarket = 0;

    dinsToMarket = (((driverLati - marketLati) * (driverLati - marketLati)) +
        ((driverLong - marketLong) * (driverLong - marketLong)));

    dinsToMarket = sqrt(dinsToMarket);
    dinsToMarket = (dinsToMarket * 100);
    String dinsToMa = dinsToMarket.toStringAsFixed(1);

    dinsToMarket =
        (((customerLati - marketLati) * (customerLati - marketLati)) +
            ((customerLong - marketLong) * (customerLong - marketLong)));

    dinsToMarket = sqrt(dinsToMarket);
    dinsToMarket = (dinsToMarket * 100);
    String dinsToCus = dinsToMarket.toStringAsFixed(1);
    double total = (dinsToMarket * 3).roundToDouble();

    cusrmerID =
        widget.order.customerId.substring(widget.order.customerId.length - 6);
    return Container(
      color: widget.order.tikeIt ? Colors.green : Colors.red,
      height: 130,
      padding: const EdgeInsets.only(top: 8.0),
      margin: EdgeInsets.only(bottom: 5),
      child: Card(
        color: Colors.cyan[50],
        margin: EdgeInsets.fromLTRB(10.0, 7.0, 10.0, 7.0),
        child: Column(
          children: [
            ListTile(
              trailing: IconButton(
                icon: Icon(
                  Icons.download_done_outlined,
                  size: 30,
                  color: Colors.blueGrey[600],
                ),
                onPressed: () async {
                  await DatabaseService().updateWhatOfOrder(
                      widget.order.idOfOrder, 'tikeIt', true);
                  await DatabaseService().updateWhatOfOrder(
                      widget.order.idOfOrder, 'driverId', user.uid);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => PageOfOrderDriver(
                              order: widget.order,
                              customer: customer,
                              market: market,
                            )),
                  );
                },
              ),
              title: Text('New order from $marketName'),
              subtitle: Text('$dinsToMa Km  + $dinsToCus Km\n $total SAR'),
            ),
            Row(
              children: [
                FlatButton.icon(
                    onPressed: () async {
                      var mapSchema =
                          'https://www.google.com/maps/search/?api=1&query=$marketLati,$marketLong';
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
                SizedBox(
                  width: 130,
                ),
                FlatButton.icon(
                    onPressed: () async {
                      var mapSchema =
                          'https://www.google.com/maps/search/?api=1&query=$customerLati,$customerLong';
                      if (await canLaunch(mapSchema)) {
                        await launch(mapSchema);
                      } else {
                        throw 'Could not launch $mapSchema';
                      }
                    },
                    icon: Icon(Icons.location_on_outlined,
                        color: Colors.cyan[600]),
                    label: Text('Customer')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
