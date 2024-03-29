import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:miskapp/module/item.dart';
import 'package:miskapp/service/database.dart';

class CustomerTile extends StatelessWidget {
  final Item customer;
  CustomerTile({this.customer});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: customer.isActive ? Colors.green[100] : Colors.red[100],
      margin: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          ListTile(
            trailing: FlatButton.icon(
              onPressed: () async {
                await Firestore.instance
                    .collection('users')
                    .document(customer.id)
                    .delete();
              },
              icon: Icon(Icons.remove_circle_outline_outlined),
              label: Text('remove!'),
            ),
            leading: CircleAvatar(
              radius: 25,
              child: ClipOval(
                child: SizedBox(
                  width: 300,
                  height: 3000,
                  child: customer.image.isEmpty
                      ? Container()
                      : Image.network(customer.image ?? ''),
                ),
              ),
            ),
            title: Text(customer.name),
            subtitle: Text('Phone is ${customer.phone} \n${customer.email}'),
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                  child: FlatButton.icon(
                      onPressed: () async {
                        await DatabaseService()
                            .updateUserActive(false, customer.id);
                      },
                      icon: Icon(Icons.remove),
                      label: Text('Freeze')),
                ),
                Expanded(
                  child: FlatButton.icon(
                      onPressed: () async {
                        await DatabaseService()
                            .updateUserActive(true, customer.id);
                      },
                      icon: Icon(Icons.done),
                      label: Text('Activate')),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
