import 'package:flutter/material.dart';
import 'package:miskapp/service/auth.dart';

class WaitPage extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Image(
                image: AssetImage('assets/Misk.PNG'),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Thanks for Registering in Misk:)',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber[600]),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Please wait while your account is verified',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffff9500)),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Activation time between 1 to 24 hour',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffff9500)),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'You can contact technical support by Email',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffff8800)),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'info@misk.com',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Color(0xff003566)),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 80.0, vertical: 10),
                    child: new FloatingActionButton(
                      heroTag: "btn2",
                      backgroundColor: Color(0xff515c5e),
                      child: Text("Back to login page"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
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
