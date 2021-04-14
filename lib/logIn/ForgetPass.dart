import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgetPassword extends StatefulWidget {
// This widget is the root of your application.
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Forget(),
    );
  }
}

class Forget extends StatefulWidget {
  @override
  _ForgetState createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  String _email = '';
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MISK',
          style: TextStyle(color: Color(0xffffffff)),
        ),
        backgroundColor: Colors.lightBlue[700],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 300,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 7.0, vertical: 7.0),
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                onChanged: (val) {
                  _email = val;
                },
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 7.0, vertical: 10),
                      child: new FloatingActionButton(
                        heroTag: "btn1",
                        backgroundColor: Color(0xff4a6fa5),
                        child: Text("Send"),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        onPressed: () async {
                          await auth.sendPasswordResetEmail(email: _email);

                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
