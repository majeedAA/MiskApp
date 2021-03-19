import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miskapp/service/auth.dart';
import 'package:miskapp/shared/loding.dart';

class SingUp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Regester();
  }
}

class Regester extends StatefulWidget {
  @override
  _RegesterState createState() => _RegesterState();
}

class _RegesterState extends State<Regester> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  String groupValue;
  String name = '';
  String email = '';
  String pass = '';
  String sity = '';
  bool isCustomer = true;
  bool isMaatket = false;
  bool isDriver = false;
  int phone;
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
              backgroundColor: Color(0xffbabbbb),
            ),
            body: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 7.0, vertical: 7.0),
                    child: TextFormField(
                      validator: (val) =>
                          val.isEmpty ? 'Enter correct an email' : null,
                      onChanged: (val) {
                        setState(() => name = val);
                      },
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Full Name',
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 7.0, vertical: 7.0),
                    child: TextFormField(
                      validator: (val) =>
                          val.isEmpty ? 'Enter correct an City' : null,
                      onChanged: (val) {
                        setState(() => sity = val);
                      },
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'City',
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 7.0, vertical: 7.0),
                    child: TextFormField(
                      validator: (val) =>
                          !val.contains(("gmail")) || !val.contains(("hotmail"))
                              ? null
                              : 'Enter correct an email',
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
                    margin:
                        EdgeInsets.symmetric(horizontal: 7.0, vertical: 7.0),
                    child: TextFormField(
                      validator: (val) =>
                          val.isEmpty ? 'Enter correct an phone' : null,
                      onChanged: (val) {
                        setState(() => phone = int.parse(val));
                      },
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Phone',
                      ),
                    ),
                  ),
                  Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 7.0, vertical: 7.0),
                      child: Row(
                        children: <Widget>[
                          Column(
                            children: [
                              Radio(
                                  value: 'Customer',
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    setState(() {
                                      groupValue = value;
                                      isCustomer = true;
                                      isDriver = false;
                                      isMaatket = false;
                                    });
                                  }),
                              Text('As Customer'),
                            ],
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Column(
                            children: [
                              Radio(
                                  value: 'Market',
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    setState(() {
                                      groupValue = value;
                                      isCustomer = false;
                                      isDriver = false;
                                      isMaatket = true;
                                    });
                                  }),
                              Text('As Market'),
                            ],
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Column(
                            children: [
                              Radio(
                                  value: 'Driver',
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    setState(() {
                                      groupValue = value;
                                      isCustomer = false;
                                      isDriver = true;
                                      isMaatket = false;
                                    });
                                  }),
                              Text('As Driver'),
                            ],
                          )
                        ],
                      )),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 7.0, vertical: 10),
                            child: new FloatingActionButton(
                              heroTag: "btn1",
                              backgroundColor: Color(0xff515c5e),
                              child: Text("SingUp"),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  print('Cus $isCustomer');
                                  print('Dri $isDriver');
                                  print('mar $isMaatket');

                                  setState(() => loading = true);
                                  dynamic result =
                                      await _auth.registerWithEmailAndPassword(
                                          email,
                                          pass,
                                          sity,
                                          name,
                                          phone,
                                          isCustomer,
                                          isMaatket,
                                          isDriver,
                                          false);
                                  if (result == null) {
                                    setState(() {
                                      loading = false;
                                      error = 'Please supply a valid email';
                                    });
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 7.0, vertical: 10),
                            child: new FloatingActionButton(
                              heroTag: "btn2",
                              backgroundColor: Color(0xff515c5e),
                              child: Text("Back"),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              onPressed: () {
                                setState(() => loading = true);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
