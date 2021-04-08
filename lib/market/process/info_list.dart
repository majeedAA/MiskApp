//import 'dart:io';
import 'package:flutter/material.dart';
import 'package:miskapp/module/item.dart';
import 'package:miskapp/module/user.dart';
import 'package:miskapp/service/auth.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  //File _image;
  String theImage = '';
  String defoltImage =
      'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    // Future getImage() async {
    //   var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    //   if (image != null) {
    //     _image = File(image.path);
    //     String fileName = basename(_image.path);
    //     StorageReference firebaseStorgeRef =
    //         FirebaseStorage.instance.ref().child(fileName);
    //     StorageUploadTask uploadTask = firebaseStorgeRef.putFile(_image);
    //     var dowurl = await (await uploadTask.onComplete).ref.getDownloadURL();
    //     var url = dowurl.toString();
    //     theImage = url;
    //     DatabaseService(uid: user.uid).updateImageUserData(theImage);
    //     print('done');
    //   } else {
    //     print('No image selected.');
    //   }
    // }

    final AuthService _auth = AuthService();
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    String email = '';
    String phone = '';
    String city = '';
    String name = '';
    String image = '';

    final users = Provider.of<List<Item>>(context) ?? [];

    for (var i = 0; i < users.length; i++) {
      if (users[i].id == user.uid) {
        email = users[i].email;
        phone = users[i].phone.toString();
        city = users[i].sity;
        name = users[i].name;
        image = users[i].image;
      }
    }

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
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
                                  //   backgroundImage:  //     new AssetImage('assets/profile_img.jpeg'),
                                  radius: _height / 10,
                                  //   backgroundImage: ,
                                  child: ClipOval(
                                    child: SizedBox(
                                      width: 300,
                                      height: 3000,
                                      // child: userData.image == '' ||
                                      //         userData.image == null
                                      //     ? Image.network(defoltImage ?? '')
                                      //     : Image.network(userData.image ?? ''),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.camera),
                                  onPressed: () {
                                    // getImage();
                                  },
                                ),
                                new SizedBox(
                                  height: _height / 30,
                                ),
                                new Text(
                                  name ?? '',
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
                          padding: new EdgeInsets.only(top: _height / 2.5),
                          child: new Container(
                            color: Colors.white,
                          ),
                        ),
                        new Padding(
                          padding: new EdgeInsets.only(
                              top: _height / 2.9,
                              left: _width / 20,
                              right: _width / 20),
                          child: new ListView(
                            children: <Widget>[
                              SizedBox(
                                height: 30,
                              ),
                              new Padding(
                                padding: new EdgeInsets.only(top: _height / 20),
                                child: new Column(
                                  children: <Widget>[
                                    infoChild(_width, Icons.email, email ?? ''),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    infoChild(_width, Icons.call, phone ?? ''),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    infoChild(
                                        _width,
                                        FontAwesomeIcons.globeAfrica,
                                        city ?? ''),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                        '_________________________________                        '),
                                    infoChild(_width, FontAwesomeIcons.headset,
                                        'Contact us via info@misk.com'),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    infoChild(_width, FontAwesomeIcons.twitter,
                                        '@miskApp'),
                                    new Padding(
                                      padding: new EdgeInsets.only(
                                          top: _height / 30),
                                      child: new Container(
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
