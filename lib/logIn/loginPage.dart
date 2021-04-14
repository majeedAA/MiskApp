import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miskapp/service/auth.dart';
import 'package:miskapp/shared/loding.dart';
import 'singup.dart';
import 'ForgetPass.dart';
import '../customer/homepageCustomer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      routes: {
        '/SingUp': (context) => SingUp(),
        '/Login': (context) => Login(),
      },
    );
  }
}

class Home extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Home> {
  String email = '';
  String pass = '';

  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();
  String error = '';

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: Text(
                'MISK',
                style: TextStyle(color: Color(0xffffffff)),
              ),
              backgroundColor: Colors.lightBlue[600],
            ),
            body: Form(
              key: _formKey,
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 300,
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 7.0, vertical: 7.0),
                    child: TextFormField(
                      validator: (val) =>
                          !val.contains(("gmail")) && !val.contains(("hotmail"))
                              ? 'Enter correct an email'
                              : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 7.0, vertical: 7.0),
                    child: TextFormField(
                      validator: (val) => val.length < 6
                          ? 'Enter a password 6+ chars long'
                          : null,
                      onChanged: (val) {
                        setState(() => pass = val);
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'password',
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        // for Singin
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 7.0, vertical: 10),
                            child: FloatingActionButton(
                                //  heroTag: "btn1",
                                backgroundColor: Color(0xff4a6fa5),
                                child: Text(
                                  "LOGIN",
                                  style: TextStyle(color: Colors.white),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    setState(() => loading = true);
                                    dynamic result =
                                        await _auth.signInWithEmailAndPassword(
                                            email, pass);
                                    if (result == null) {
                                      setState(() {
                                        loading = false;
                                        error =
                                            'The username or password you provided is incorrect. Please try again.';
                                      });
                                    }
                                  }
                                }),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 7.0, vertical: 10),
                            child: new FloatingActionButton(
                              heroTag: "btn2",
                              backgroundColor: Color(0xff4a6fa5),
                              child: Text("Forget Password"),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ForgetPassword(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: new FloatingActionButton(
                      heroTag: "btn3",
                      backgroundColor: Color(0xff4a6fa5),
                      child: Text("Sign Up"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/SingUp');
                      },
                    ),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
                ],
              ),
            ),
          );
  }
}
