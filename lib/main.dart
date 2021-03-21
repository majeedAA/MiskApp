import 'package:flutter/material.dart';
import 'package:miskapp/authenticate/authenticate.dart';
import 'package:miskapp/logIn/wapper.dart';
import 'package:miskapp/market/homePage.dart';
import 'logIn/loginPage.dart';
import 'market/homePageMarket.dart';
import 'package:provider/provider.dart';
import 'service/auth.dart';
import 'module/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wapper(),
      ),
    );
  }
}

// Container(
//           child: FlatButton.icon(
//             icon: Icon(Icons.person),
//             label: Text('logout',
//                 style: new TextStyle(
//                     fontSize: 12.0,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold)),
//             onPressed: () async {
//               await _auth.signOut();
//             },
//           ),
//         ),
