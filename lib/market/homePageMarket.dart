import 'package:flutter/material.dart';
import 'package:miskapp/market/process/setting_form.dart';

class LogInMarket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return market();
  }
}

class market extends StatefulWidget {
  @override
  _marketState createState() => _marketState();
}

class _marketState extends State<market> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MISK Login market',
          style: TextStyle(color: Color(0xffffffff)),
        ),
        backgroundColor: Color(0xffbabbbb),
      ),
      body: Container(),
    );
  }
}
