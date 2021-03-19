import 'package:flutter/material.dart';
import 'buttonB.dart';
import 'theNotiProcess.dart';

class TheNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notification',
          style: TextStyle(color: Color(0xffffffff)),
        ),
        backgroundColor: Color(0xffbabbbb),
      ),
      body: ListView(
        children: <Widget>[
          TheNotifProcess(
            marketName: 'tmimi',
          ),
          TheNotifProcess(
            marketName: 'panda',
          ),
        ],
      ),
    );
  }
}
