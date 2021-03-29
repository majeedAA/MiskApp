import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:miskapp/module/item.dart';
import 'package:miskapp/service/database.dart';

class MarketTileOfAdmin extends StatelessWidget {
  final Item market;
  MarketTileOfAdmin({this.market});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: market.isActive ? Colors.green[200] : Colors.red[200],
      margin: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          ListTile(
            trailing: FlatButton.icon(
              onPressed: () async {
                await Firestore.instance
                    .collection('users')
                    .document(market.id)
                    .delete();
              },
              icon: Icon(Icons.remove_circle_outline_outlined),
              label: Text('remove!'),
            ),
            leading: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.green[100],
            ),
            title: Text(market.name),
            subtitle: Text('Phone is ${market.phone} \n${market.sity} City'),
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                  child: FlatButton.icon(
                      onPressed: () async {
                        await DatabaseService()
                            .updateUserActive(false, market.id);
                      },
                      icon: Icon(Icons.remove),
                      label: Text('Stope')),
                ),
                Expanded(
                  child: FlatButton.icon(
                      onPressed: () async {
                        await DatabaseService()
                            .updateUserActive(true, market.id);
                      },
                      icon: Icon(Icons.done),
                      label: Text('acctive')),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
