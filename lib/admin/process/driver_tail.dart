import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:miskapp/module/item.dart';
import 'package:miskapp/service/database.dart';

class DriverTileForAdmin extends StatelessWidget {
  final Item driver;
  DriverTileForAdmin({this.driver});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: driver.isActive ? Colors.green[200] : Colors.red[200],
      margin: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          ListTile(
            trailing: FlatButton.icon(
              onPressed: () async {
                await Firestore.instance
                    .collection('users')
                    .document(driver.id)
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
                  child: driver.image.isEmpty
                      ? Container()
                      : Image.network(driver.image ?? ''),
                ),
              ),
            ),
            title: Text(driver.name),
            subtitle: Text('Phone is ${driver.phone} \n${driver.email}'),
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                  child: FlatButton.icon(
                      onPressed: () async {
                        await DatabaseService()
                            .updateUserActive(false, driver.id);
                      },
                      icon: Icon(Icons.remove),
                      label: Text('Freeze')),
                ),
                Expanded(
                  child: FlatButton.icon(
                      onPressed: () async {
                        await DatabaseService()
                            .updateUserActive(true, driver.id);
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
