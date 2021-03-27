import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'buttonB.dart';
import 'theNotiProcess.dart';

final CollectionReference coll = Firestore.instance.collection('card');

class TheNotification extends StatefulWidget {
  @override
  _TheNotificationState createState() => _TheNotificationState();
}

class _TheNotificationState extends State<TheNotification> {
  @override
  void initState() {
    // TODO: implement initState
    //   getCart();
    //   super.initState();
    // }

    // getCart() {
    //   coll.getDocuments().then((QuerySnapshot snapshot) {
    //     snapshot.documents.forEach((DocumentSnapshot doc) {
    //       print(doc.data);
    //     });
    //   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notification',
          style: TextStyle(color: Color(0xffffffff)),
        ),
        backgroundColor: Color(0xffbabbbb),
      ),
      body: ListView(
        children: <Widget>[
          TheNotifProcess(
            marketName: 'tmimi',
          ),
          TheNotifProcess(
            marketName: 'panda',
          ),
        ],
      ),
    );
  }
}
