import 'package:flutter/material.dart';
import 'package:miskapp/customer/processCus/items_market.dart';
import 'package:miskapp/module/item.dart';
import 'dart:math';

class MarketTile extends StatelessWidget {
  final double userLati;
  final double userLongi;
  final Item market;
  MarketTile({this.market, this.userLati, this.userLongi});
  static double dins = 0;
  @override
  Widget build(BuildContext context) {
    double driveCost = 0;

    double marketLongi = market.longitude;
    double marketLati = market.latitude;

    dins = (((userLati - marketLati) * (userLati - marketLati)) +
        ((userLongi - marketLongi) * (userLongi - marketLongi)));

    dins = sqrt(dins);
    dins = dins * 100;
    dins < 5 ? driveCost = 15 : driveCost = dins * 3;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => ItemOfMarket(
                    idMarket: market.id,
                  )),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 25,
              child: ClipOval(
                child: SizedBox(
                  width: 300,
                  height: 3000,
                  child: market.image.isEmpty
                      ? Container()
                      : Image.network(market.image ?? ''),
                ),
              ),
            ),
            title: Text(market.name),
            subtitle: Text(
                '${dins.roundToDouble()} Km \n${driveCost.roundToDouble()} SAR'),
          ),
        ),
      ),
    );
  }
}
