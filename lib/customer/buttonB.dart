import 'package:flutter/material.dart';
import 'package:miskapp/customer/Orders.dart';
import 'package:miskapp/customer/homepageCustomer.dart';
import 'package:miskapp/customer/notif.dart';
import 'package:miskapp/market/accountMarket.dart';

class HomePageOfCustomer extends StatefulWidget {
  @override
  _HomePageOfCustomerState createState() => _HomePageOfCustomerState();
}

class _HomePageOfCustomerState extends State<HomePageOfCustomer> {
  int _curruntIndex = 3;

  List<Widget> _widgetOption = <Widget>[
    AccountMarket(),
    TheNotification(),
    Order(),
    Login(),
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
            backgroundColor: Color(0xff343a40),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active_rounded),
            title: Text('notification'),
            backgroundColor: Colors.deepOrange[300],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            title: Text('Order'),
            backgroundColor: Colors.yellow[900],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            title: Text('Market'),
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
