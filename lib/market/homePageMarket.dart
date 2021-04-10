import 'package:flutter/material.dart';
import 'package:miskapp/market/forNewOrder/list_of_orders.dart';
import 'package:miskapp/module/new_order.dart';
import 'package:miskapp/module/user.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';

class LogInMarket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Market();
  }
}

class Market extends StatefulWidget {
  @override
  _MarketState createState() => _MarketState();
}

class _MarketState extends State<Market> {
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
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                FlatButton.icon(
                  icon: Icon(Icons.location_on_outlined),
                  label: Text(''),
                  onPressed: () {
                    _getCurruntLocation(user.uid);
                  },
                )
              ],
              title: Text(
                'New Orders',
                style: TextStyle(color: Color(0xffffffff)),
              ),
              backgroundColor: Color(0xffbabbbb),
            ),
            body: ListOfOrdersMarket(),
          );
        });
  }
}
