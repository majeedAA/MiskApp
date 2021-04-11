import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:miskapp/Driver/forCurruntPage/list_of_order.dart';
import 'package:miskapp/module/chat.dart';
import 'package:miskapp/module/item.dart';
import 'package:miskapp/module/new_order.dart';
import 'package:miskapp/module/user.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';

class CurrentOrder extends StatefulWidget {
  @override
  _CurrentOrderState createState() => _CurrentOrderState();
}

class _CurrentOrderState extends State<CurrentOrder> {
  void _getCurruntLocation(String uid) async {
    final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      DatabaseService(uid: uid)
          .updateLocationUserData(position.latitude, position.longitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamProvider<List<NewOrder>>.value(
      value: DatabaseService().newOrder,
      child: StreamProvider<List<Item>>.value(
        value: DatabaseService().items,
        child: StreamProvider<List<Chat>>.value(
          value: DatabaseService().chats,
          builder: (context, snapshot) {
            return Scaffold(
              appBar: AppBar(
                actions: <Widget>[
                  FlatButton.icon(
                    icon: Icon(Icons.location_on_outlined),
                    label: Text(''),
                    onPressed: () {
                      _getCurruntLocation(user.uid);
                    },
                  )
                ],
                title: Text(
                  'Current Page',
                  style: TextStyle(color: Color(0xffffffff)),
                ),
                backgroundColor: Color(0xff4a6fa5),
              ),
              backgroundColor: Colors.blue[50],
              body: ListOfCurruntOrdersDriver(),
            );
          },
        ),
      ),
    );
  }
}
