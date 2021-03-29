import 'package:flutter/material.dart';
import 'package:miskapp/admin/account.dart';
import 'package:miskapp/admin/driverPage.dart';
import 'package:miskapp/admin/homePage_admin.dart';
import 'package:miskapp/admin/marketPage.dart';
import 'package:miskapp/market/accountMarket.dart';

class FristPageOfAdmin extends StatefulWidget {
  @override
  _FristPageOfAdminState createState() => _FristPageOfAdminState();
}

class _FristPageOfAdminState extends State<FristPageOfAdmin> {
  int _curruntIndex = 3;
  List<Widget> _widgetOption = <Widget>[
    // AccountOfAdmin(),
    AccountMarket(),
    DriverPageOfAdmin(),
    MarketPageOfAdmin(),
    HomePageOfAdmin(),
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
            backgroundColor: Colors.lightBlue[400],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.drive_eta_outlined),
            title: Text('Driver page'),
            backgroundColor: Colors.lightBlue[600],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            title: Text('Market page'),
            backgroundColor: Colors.lightBlue[200],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline_rounded),
            title: Text('Customer page'),
            backgroundColor: Colors.lightBlue[400],
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
