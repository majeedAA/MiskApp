import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:miskapp/customer/processCus/marketTile.dart';
import 'package:miskapp/module/card.dart';
import 'package:miskapp/module/user.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';

class Pill extends StatefulWidget {
  @override
  _PillState createState() => _PillState();
}

class _PillState extends State<Pill> {
  final _formKey = GlobalKey<FormState>();

  final List<String> pays = [
    'Cash',
    'mada',
    'Apple Pay',
    'Visa',
  ];
  String idMarket = '';

  String pay;

  String notis;

  String coupon;

  String time;

  bool driveIt = false;

  Color ava = Colors.green[300];

  Color non = Colors.grey[500];

  @override
  Widget build(BuildContext context) {
    List<Cardd> itemOfCustomer = [];
    List<dynamic> allItem = [];

    double total = 0;
    final user = Provider.of<User>(context);
    final card = Provider.of<List<Cardd>>(context) ?? [];

    for (var i = 0; i < card.length; i++) {
      if (card[i].idCustomer == user.uid) {
        itemOfCustomer.add(card[i]);
      }
    }

    for (var i = 0; i < itemOfCustomer.length; i++) {
      idMarket = itemOfCustomer[0].idMarket;
      if (itemOfCustomer[0].idMarket == itemOfCustomer[i].idMarket) {
        total += itemOfCustomer[i].totalprice;
        idMarket = itemOfCustomer[i].idMarket;
        allItem.add(itemOfCustomer[i].nameOfItem);
      }
    }

    for (var i = 0; i < itemOfCustomer.length; i++) {
      idMarket = itemOfCustomer[0].idMarket;
      if (itemOfCustomer[0].idMarket == itemOfCustomer[i].idMarket) {
        allItem.add(itemOfCustomer[i].price);
      }
    }
    for (var i = 0; i < itemOfCustomer.length; i++) {
      idMarket = itemOfCustomer[0].idMarket;
      if (itemOfCustomer[0].idMarket == itemOfCustomer[i].idMarket) {
        allItem.add(itemOfCustomer[i].quantity);
      }
    }
    for (var i = 0; i < itemOfCustomer.length; i++) {
      idMarket = itemOfCustomer[0].idMarket;
      if (itemOfCustomer[0].idMarket == itemOfCustomer[i].idMarket) {
        allItem.add(itemOfCustomer[i].totalprice);
      }
    }
    void deletItem() {
      for (var i = 0; i < card.length; i++) {
        if (card[i].idCustomer == user.uid) {
          Firestore.instance
              .collection('card')
              .document(card[i].idOfCart)
              .delete();
        }
      }
    }

    double dins = MarketTile.dins;
    double totalCost = 0;

    totalCost = dins <= 5 ? totalCost = 15 : totalCost = dins * 3;
    totalCost = totalCost.ceil().toDouble();

    driveIt ? total = total + totalCost : total = total + 5;
    total == 5 || total == 15 ? total = 0 : total = total;

    return Expanded(
      key: _formKey,
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(7),
            color: Color(0xffccdbfd),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    initialValue: '',
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '  any Notes?',
                    ),
                    onChanged: (val) {
                      setState(() {
                        notis = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        driveIt
                            ? 'total with Delivery: '
                            : 'total with Pickup: ',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        total.toStringAsFixed(2),
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField(
                    value: 'Cash',
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Pay by',
                    ),
                    items: pays.map((pays) {
                      return DropdownMenuItem(
                        value: pays,
                        child: Text(pays),
                      );
                    }).toList(),
                    onChanged: (val) => setState(() => pay = val),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (val) => val.isEmpty ? val = 'know' : null,
                    initialValue: '',
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Time to take it',
                    ),
                    onChanged: (val) => setState(() => time = val),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 105,
                      ),
                      FlatButton.icon(
                          onPressed: () {
                            setState(() {
                              driveIt = true;
                            });
                          },
                          icon: Icon(
                            Icons.drive_eta,
                            color: driveIt == true ? ava : non,
                          ),
                          label: Text('Drive')),
                      SizedBox(
                        width: 20,
                      ),
                      FlatButton.icon(
                          onPressed: () {
                            setState(() {
                              driveIt = false;
                            });
                          },
                          icon: Icon(
                            Icons.shopping_bag_sharp,
                            color: driveIt == false ? ava : non,
                          ),
                          label: Text('Pickup')),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                    child: FloatingActionButton(
                        backgroundColor: Colors.indigo[700],
                        child: Text("Send Cart"),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        onPressed: () async {
                          await DatabaseService(uid: user.uid)
                              .updateNewOrderData(allItem, user.uid, idMarket,
                                  pay, notis, time, driveIt, total);
                          deletItem();
                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
