import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:miskapp/module/card.dart';
import 'package:miskapp/module/user.dart';
import 'package:provider/provider.dart';

class Pill extends StatefulWidget {
  @override
  _PillState createState() => _PillState();
}

class _PillState extends State<Pill> {
  // void initState() {

  // }

  List<dynamic> allItem = [];
  final List<String> pays = [
    'cash',
    'mada',
    'appel Pay',
    'Visa',
  ];
  String idMarket = '';

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
    final user = Provider.of<User>(context);
    final card = Provider.of<List<Cardd>>(context) ?? [];
    for (var i = 0; i < card.length; i++) {
      if (card[i].idCustomer == user.uid &&
          card[0].idMarket == card[i].idMarket) {
        total += card[i].totalprice;
        idMarket = card[i].idMarket;
        allItem.add(card[i].idCustomer);
        allItem.add(card[i].idMarket);
        allItem.add(card[i].nameOfItem);
        allItem.add(card[i].price);
        allItem.add(card[i].quantity);
        allItem.add(card[i].totalprice);
        allItem.add('done');
      }
    }

    // print(allItem);
    return Expanded(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(7),
            color: Color(0xffccdbfd),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  readOnly: false,
                  initialValue: '',
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '  any Notis?',
                  ),
                  onChanged: (val) {},
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Total :',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$total',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                  value: 'cash',
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
                  readOnly: false,
                  initialValue: '',
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Time for tick it',
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
                        label: Text('Bickup')),
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
                        // if (_formKey.currentState.validate()) {
                        //   await DatabaseService(uid: user.uid).updatCardData(
                        //     user.uid ?? '',
                        //     marketId ?? '',
                        //     '' ?? '',
                        //     itemName ?? '',
                        //     _totalPrice ?? itemPrice,
                        //     itemPrice ?? 0,
                        //     _count ?? 0,
                        //   );
                        //   Navigator.pop(context);
                        // } else {
                        //   return Loading();
                        // }
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
