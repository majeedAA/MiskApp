import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:miskapp/admin/frist_page.dart';
import 'package:miskapp/authenticate/authenticate.dart';
import 'package:miskapp/customer/buttonB.dart';
import 'package:miskapp/customer/homepageCustomer.dart';
import 'package:miskapp/logIn/loginPage.dart';
import 'package:miskapp/logIn/wait_page.dart';
import 'package:miskapp/market/homePageMarket.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';
import 'package:miskapp/module/user.dart';
import 'package:miskapp/market/homePage.dart';

class Wapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user != null) {
      return StreamBuilder<UserData>(
          stream: DatabaseService(uid: user.uid).userData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              UserData appUser = snapshot.data;

              // return either the Home or Authenticate widget

              if (appUser.isActive == false) {
                return WaitPage();
              } else if (appUser.isAdmin ?? false) {
                return FristPageOfAdmin();
              } else if (appUser.isMarket ?? false) {
                return HomePageMarket();
              } else if (appUser.isDriver ?? false) {
                return HomePageMarket();
              } else
                return HomePageOfCustomer();
            } else
              return Container();
          });
    } else {
      return authenticate();
    }

    //return LogInMarket();
  }
}
