import 'package:flutter/material.dart';

import 'homePageMarket.dart';
import 'pageOfMenu.dart';
import 'notiMarket.dart';
import 'accountMarket.dart';

class HomePageMarket extends StatefulWidget {
  @override
  _HomePageMarketState createState() => _HomePageMarketState();
}

class _HomePageMarketState extends State<HomePageMarket> {
  int _curruntIndex = 3;

  List<Widget> _widgetOption = <Widget>[
    AccountMarket(),
    MenuMarket(),
    NotiMarket(),
    LogInMarket(),
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
            icon: Icon(Icons.store),
            title: Text('Account'),
            backgroundColor: Color(0xff343a40),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_rounded),
            title: Text('Menu'),
            backgroundColor: Colors.yellow[900],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            title: Text('Past order'),
            backgroundColor: Colors.deepOrange[300],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            title: Text('new Order'),
            backgroundColor: Colors.lightBlueAccent[200],
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
