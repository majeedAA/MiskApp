import 'package:flutter/material.dart';
import 'package:miskapp/admin/forCouboons/couboons_page.dart';
import 'package:miskapp/service/auth.dart';

class AccountOfAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 150,
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: new FloatingActionButton(
                      heroTag: "btn1",
                      backgroundColor: Color(0xff289672),
                      child: Text(
                        "Couboons",
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
                            builder: (BuildContext context) => PageOfCouboons(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 150,
                    margin: EdgeInsets.all(15),
                    child: new FloatingActionButton(
                      heroTag: "btn2",
                      backgroundColor: Color(0xff1e6f5c),
                      child: Text(
                        "nothing know",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      onPressed: () {},
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
                      heroTag: "btn3",
                      backgroundColor: Color(0xff1e6f5c),
                      child: Text(
                        "Contact with users",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 200,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 100),
                    child: new FloatingActionButton(
                      heroTag: "btn4",
                      backgroundColor: Colors.teal[900],
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
