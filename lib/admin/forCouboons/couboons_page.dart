import 'package:flutter/material.dart';
import 'package:miskapp/admin/forCouboons/add_new_couboon.dart';
import 'package:miskapp/admin/forCouboons/copuon_list.dart';
import 'package:miskapp/module/coupon.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';

class PageOfCouboons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Coupon>>.value(
        value: DatabaseService().coupon,
        builder: (context, snapshot) {
          return MaterialApp(
            home: DefaultTabController(
              length: 1,
              child: Scaffold(
                appBar: AppBar(
                  title: Text(
                    'Coupon',
                  ),
                  backgroundColor: Color(0xff4a6fa5),
                  actions: <Widget>[
                    FlatButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_forward_ios_rounded),
                      label: Text(''),
                    ),
                  ],
                ),
                body: SafeArea(
                  child: Column(
                    children: <Widget>[
                      Container(
                        color: Color(0xffedf2fb),
                        height: MediaQuery.of(context).size.height / 1.3,
                        child: CouponList(),
                      ),
                      AddNewCouboon(),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
