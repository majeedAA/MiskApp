import 'package:flutter/material.dart';
import 'package:miskapp/customer/Orders.dart';
import 'package:miskapp/customer/cart/cart_customer.dart';
import 'package:miskapp/customer/homepageCustomer.dart';
import 'package:miskapp/market/accountMarket.dart';

class HomePageOfCustomer extends StatefulWidget {
  @override
  _HomePageOfCustomerState createState() => _HomePageOfCustomerState();
}

class _HomePageOfCustomerState extends State<HomePageOfCustomer> {
  int _curruntIndex = 3;

  List<Widget> _widgetOption = <Widget>[
    AccountMarket(),
    Cart(),
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
            // label: 'Account',
            title: Text('Account'),
            backgroundColor: Colors.lightBlue[400],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            title: Text('Cart'),
            backgroundColor: Colors.lightBlue[600],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            title: Text('Order'),
            backgroundColor: Colors.lightBlue[200],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            title: Text('Market'),
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
