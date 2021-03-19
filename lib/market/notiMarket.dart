import 'package:flutter/material.dart';
import 'NotiProcessMarket.dart';

class NotiMarket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Notification();
  }
}

class Notification extends StatefulWidget {
  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MISK Notification market',
          style: TextStyle(color: Color(0xffffffff)),
        ),
        backgroundColor: Color(0xffbabbbb),
      ),
      body: ListView(
        children: <Widget>[
          TheNotifProcess(
            marketName: 'majeed',
          ),
          TheNotifProcess(
            marketName: 'majeed',
          ),
        ],
      ),
    );
  }
}
