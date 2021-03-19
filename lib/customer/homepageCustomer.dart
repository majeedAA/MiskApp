// import 'dart:html';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Resuble_card.dart';
import 'buttonB.dart';

class Login extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Log(),
    );
  }
}

class Log extends StatefulWidget {
  @override
  _forgetState createState() => _forgetState();
}

class _forgetState extends State<Log> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MISK Customer Login',
          style: TextStyle(color: Color(0xffffffff)),
        ),
        backgroundColor: Color(0xffbabbbb),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),

            /// In AnimSearchBar widget, the width, textController, onSuffixTap are required properties.
            /// You have also control over the suffixIcon, prefixIcon, helpText and animationDurationInMilli
            child: AnimSearchBar(
              width: 400,
              textController: textController,
              onSuffixTap: () {
                setState(() {
                  textController.clear();
                });
              },
            ),
          ),
          Container(
            //Frist Row
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  name: 'tmimi market',
                  Theimage:
                      'https://www.pngkey.com/png/detail/271-2714069_al-tamimi-safeway-tamimi-markets-logo.png',
                )),
                Expanded(
                    child: ReusableCard(
                  name: 'tmimi market',
                )),
              ],
            ),
          ),
          Container(
            //2ed Row
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  name: 'tmimi market',
                )),
                Expanded(
                    child: ReusableCard(
                  name: 'tmimi market',
                )),
              ],
            ),
          ),
          Container(
            //3ed Row
            child: Row(
              children: <Widget>[
                Expanded(child: ReusableCard()),
                Expanded(child: ReusableCard()),
              ],
            ),
          ),
        ],
      ),
      //  bottomNavigationBar: new Boutton()
    );
  }
}
