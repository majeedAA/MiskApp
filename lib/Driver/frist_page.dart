import 'package:flutter/material.dart';
import 'package:miskapp/Driver/current_page.dart';
import 'package:miskapp/Driver/cuttent_page.dart';
import 'package:miskapp/Driver/past_orser.dart';
import 'package:miskapp/market/accountMarket.dart';

class FristPageOfDriver extends StatefulWidget {
  @override
  _FristPageOfDriverState createState() => _FristPageOfDriverState();
}

class _FristPageOfDriverState extends State<FristPageOfDriver> {
  int _curruntIndex = 3;
  List<Widget> _widgetOption = <Widget>[
    AccountMarket(),
    PastOrder(),
    CurrentOrders(),
    CurrentOrder(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOption.elementAt(_curruntIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _curruntIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Account'),
            backgroundColor: Colors.cyanAccent[700],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_add_check_outlined),
            title: Text('Past order'),
            backgroundColor: Colors.cyan[600],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.drive_eta_outlined),
            title: Text('current order'),
            backgroundColor: Colors.cyan[400],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.drive_eta),
            title: Text('new order'),
            backgroundColor: Colors.cyanAccent[400],
          ),
        ],
        onTap: (index) {
          setState(() {
            _curruntIndex = index;
          });
        },
      ),
    );
  }
}
