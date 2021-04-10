import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:miskapp/admin/forCouboons/couboons_page.dart';
import 'package:miskapp/admin/process/rate_list.dart';
import 'package:miskapp/service/auth.dart';

class AccountOfAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          '',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              // color: Colors.black,
              width: 100,
              child: Text(
                '',
              ),
            ),
            // SizedBox(
            //   height: 30,
            // ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 150,
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: new FloatingActionButton(
                      heroTag: "btn1",
                      backgroundColor: Colors.deepPurple[600],
                      child: Row(
                        children: [
                          SizedBox(
                            width: 150,
                          ),
                          Icon(
                            FontAwesomeIcons.tag,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "coupon",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => PageOfCouboons(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 150,
                    margin: EdgeInsets.all(15),
                    child: new FloatingActionButton(
                      heroTag: "btn2",
                      backgroundColor: Colors.deepPurple[300],
                      child: Text(
                        "All rates",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                PageOfRateAdmin(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 100),
                    child: new FloatingActionButton(
                      heroTag: "btn4",
                      backgroundColor: Colors.amber[200],
                      child: Text(
                        "Logout",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      onPressed: () async {
                        await _auth.signOut();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
