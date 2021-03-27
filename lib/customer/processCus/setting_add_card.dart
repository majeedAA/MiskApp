import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:miskapp/module/menu.dart';
import 'package:miskapp/module/user.dart';
import 'package:miskapp/service/auth.dart';
import 'package:miskapp/service/database.dart';
import 'package:miskapp/shared/loding.dart';
import 'package:provider/provider.dart';

class SittingAddToCard extends StatefulWidget {
  final String marketId;
  final String itemName;
  final String itemCatigory;
  final String itemUnit;
  final double itemPrice;
  SittingAddToCard(
      {this.marketId,
      this.itemName,
      this.itemCatigory,
      this.itemUnit,
      this.itemPrice});
  @override
  _SittingAddToCardState createState() => _SittingAddToCardState(
      marketId: marketId,
      itemName: itemName,
      itemCatigory: itemCatigory,
      itemUnit: itemUnit,
      itemPrice: itemPrice);
}

class _SittingAddToCardState extends State<SittingAddToCard> {
  final String marketId;
  final String itemName;
  final String itemCatigory;
  final String itemUnit;
  final double itemPrice;

  _SittingAddToCardState(
      {this.marketId,
      this.itemName,
      this.itemCatigory,
      this.itemUnit,
      this.itemPrice});

  @override
  final _formKey = GlobalKey<FormState>();
  int _count = 1;
  double _totalPrice;
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            'Add to Card',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 20.0),
          Expanded(
            child: Text(
              itemName,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          TextFormField(
            readOnly: true,
            initialValue: 'Quantity',
            decoration: InputDecoration(
              border: InputBorder.none,
              //labelText: 'Name',
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    _count.toString(),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Expanded(
                  child: FlatButton.icon(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    // color: Colors.blueGrey[50],
                    onPressed: () {
                      setState(() {
                        if (_count <= 1) {
                          _count = 1;
                        } else {
                          _count--;
                          _totalPrice = _count * itemPrice;
                        }
                      });
                    },
                    icon: Icon(Icons.remove),
                    label: Text(''),
                  ),
                ),
                Expanded(
                  child: FlatButton.icon(
                    // color: Colors.blueGrey[50],
                    onPressed: () {
                      setState(() {
                        _count++;
                        _totalPrice = _count * itemPrice;
                      });
                    },
                    icon: Icon(Icons.add),
                    label: Text(''),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.blue[200],
            height: 20,
            thickness: 2,
          ),
          SizedBox(height: 15.0),
          Text(
            'Total',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            _count == 1 ? itemPrice.toString() : _totalPrice.toString(),
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                  child: new FloatingActionButton(
                      backgroundColor: Color(0xff515c5e),
                      child: Text("Add"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          await DatabaseService(uid: user.uid).updatCardData(
                            user.uid ?? '',
                            marketId ?? '',
                            '' ?? '',
                            itemName ?? '',
                            _totalPrice ?? itemPrice,
                            itemPrice ?? 0,
                            _count ?? 0,
                          );
                          Navigator.pop(context);
                        } else {
                          return Loading();
                        }
                      }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
