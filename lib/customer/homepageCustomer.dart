import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:miskapp/customer/processCus/listOfMarket.dart';
import 'package:miskapp/module/item.dart';
import 'package:miskapp/module/user.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
    return StreamProvider<List<Item>>.value(
        value: DatabaseService().items,
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
                'MISK Customer Login',
                style: TextStyle(color: Color(0xffffffff)),
              ),
              backgroundColor: Color(0xffbabbbb),
            ),
            body: ListOfMarket(),
          );
        });
  }
}
