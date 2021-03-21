import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:miskapp/module/item.dart';
import 'package:miskapp/module/user.dart';
import 'package:miskapp/service/auth.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';

class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final info = Provider.of<QuerySnapshot>(context) ?? null;
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          UserData userData = snapshot.data;
          return Container(
            child: new Stack(
              children: <Widget>[
                new Container(
                  decoration: new BoxDecoration(
                      gradient: new LinearGradient(colors: [
                    const Color(0xFF26CBE6),
                    const Color(0xFF26CBC0),
                  ], begin: Alignment.topCenter, end: Alignment.center)),
                ),
                new Scaffold(
                  backgroundColor: Colors.transparent,
                  body: new Container(
                    child: new Stack(
                      children: <Widget>[
                        new Align(
                          alignment: Alignment.center,
                          child: new Padding(
                            padding: new EdgeInsets.only(top: _height / 15),
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                new CircleAvatar(
                                  // backgroundImage:
                                  //     new AssetImage('assets/profile_img.jpeg'),
                                  radius: _height / 10,
                                ),
                                new SizedBox(
                                  height: _height / 30,
                                ),
                                new Text(
                                  userData.name ?? '',
                                  style: new TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                        new Padding(
                          padding: new EdgeInsets.only(top: _height / 2.2),
                          child: new Container(
                            color: Colors.white,
                          ),
                        ),
                        new Padding(
                          padding: new EdgeInsets.only(
                              top: _height / 2.6,
                              left: _width / 20,
                              right: _width / 20),
                          child: new Column(
                            children: <Widget>[
                              // new Container(
                              //   decoration: new BoxDecoration(
                              //       color: Colors.white,
                              //       boxShadow: [
                              //         new BoxShadow(
                              //             color: Colors.black45,
                              //             blurRadius: 2.0,
                              //             offset: new Offset(0.0, 2.0))
                              //       ]),
                              //   child: new Padding(
                              //     padding: new EdgeInsets.all(_width / 20),
                              //     child: new Row(
                              //         mainAxisAlignment: MainAxisAlignment.center,
                              //         children: <Widget>[
                              //           headerChild('Photos', 114),
                              //           headerChild('Followers', 1205),
                              //           headerChild('Following', 360),
                              //         ]),
                              //   ),
                              // ),
                              SizedBox(
                                height: 30,
                              ),

                              new Padding(
                                padding: new EdgeInsets.only(top: _height / 20),
                                child: new Column(
                                  children: <Widget>[
                                    infoChild(_width, Icons.email,
                                        userData.email ?? ''),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    infoChild(_width, Icons.call,
                                        userData.phone.toString() ?? ''),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    infoChild(_width, Icons.location_city,
                                        userData.sity ?? ''),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    infoChild(_width, Icons.chat_bubble,
                                        'Show all comments'),
                                    new Padding(
                                      padding: new EdgeInsets.only(
                                          top: _height / 30),
                                      child: new Container(
                                        // width: _width / 3,
                                        // height: _height / 20,
                                        decoration: new BoxDecoration(
                                            color: const Color(0xFF26CBE6),
                                            borderRadius: new BorderRadius.all(
                                                new Radius.circular(
                                                    _height / 40)),
                                            boxShadow: [
                                              new BoxShadow(
                                                  color: Colors.black87,
                                                  blurRadius: 2.0,
                                                  offset: new Offset(0.0, 1.0))
                                            ]),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: FlatButton.icon(
                                            icon: Icon(Icons.person),
                                            label: Text('logout',
                                                style: new TextStyle(
                                                    fontSize: 12.0,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            onPressed: () async {
                                              await _auth.signOut();
                                            },
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget headerChild(String header, int value) => new Expanded(
          child: new Column(
        children: <Widget>[
          new Text(header),
          new SizedBox(
            height: 8.0,
          ),
          new Text(
            '$value',
            style: new TextStyle(
                fontSize: 14.0,
                color: const Color(0xFF26CBE6),
                fontWeight: FontWeight.bold),
          )
        ],
      ));

  Widget infoChild(double width, IconData icon, data) => new Padding(
        padding: new EdgeInsets.only(bottom: 8.0),
        child: new InkWell(
          child: new Row(
            children: <Widget>[
              new SizedBox(
                width: width / 10,
              ),
              new Icon(
                icon,
                color: const Color(0xFF26CBE6),
                size: 36.0,
              ),
              new SizedBox(
                width: width / 20,
              ),
              new Text(data)
            ],
          ),
          onTap: () {
            print('Info Object selected');
          },
        ),
      );
}
