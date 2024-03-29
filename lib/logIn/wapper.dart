import 'package:flutter/material.dart';
import 'package:miskapp/Driver/frist_page.dart';
import 'package:miskapp/admin/frist_page.dart';
import 'package:miskapp/authenticate/authenticate.dart';
import 'package:miskapp/customer/buttonB.dart';
import 'package:miskapp/logIn/wait_page.dart';
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

              if (!appUser.isActive ?? false) {
                return WaitPage();
              } else if (appUser.isAdmin ?? false) {
                return FristPageOfAdmin();
              } else if (appUser.isMarket ?? false) {
                return HomePageMarket();
              } else if (appUser.isDriver ?? false) {
                return FristPageOfDriver();
              } else if (appUser.isCustomer ?? false) {
                return HomePageOfCustomer();
              } else {
                return WaitPage();
              }
            } else
              return Container();
          });
    } else {
      return Authenticate();
    }
  }
}
