import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:miskapp/module/item.dart';
import 'package:miskapp/module/menu.dart';
import 'package:miskapp/module/user.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart';

final userRef = Firestore.instance.collection('menu');

class MenuTile extends StatelessWidget {
  final Menu menu;
  MenuTile({this.menu});
  File _image;

  String theImage = '';

  String idItem = '';

  String defoltImage =
      'https://www.pngitem.com/pimgs/m/27-272007_transparent-product-icon-png-product-vector-icon-png.png';

  getUsers(Menu menu) {
    userRef.getDocuments().then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((element) {
        if (menu.name == element.data.values.elementAt(3) &&
            menu.price == element.data.values.elementAt(2) &&
            menu.caticury == element.data.values.elementAt(1)) {
          idItem = element.documentID;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        _image = File(image.path);
        String fileName = basename(_image.path);

        StorageReference firebaseStorgeRef =
            FirebaseStorage.instance.ref().child(fileName);
        StorageUploadTask uploadTask = firebaseStorgeRef.putFile(_image);
        var dowurl = await (await uploadTask.onComplete).ref.getDownloadURL();
        var url = dowurl.toString();
        theImage = url;
        DatabaseService().updatemenuImage(theImage, menu.idItem);
        print('done');
      } else {
        print('No image selected.');
      }
    }

    getUsers(menu);
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        //margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              trailing: FlatButton.icon(
                onPressed: () async {
                  await Firestore.instance
                      .collection('menu')
                      .document(idItem)
                      .delete();
                },
                icon: Icon(Icons.remove_circle_outline_outlined),
                label: Text(''),
              ),
              leading: CircleAvatar(
                radius: 25.0,
                backgroundColor: Colors.brown[100],
                child: ClipOval(
                  child: SizedBox(
                    width: 300,
                    height: 3000,
                    child: menu.image == '' || menu.image == null
                        ? Image.network(defoltImage)
                        : Image.network(menu.image),
                  ),
                ),
              ),
              title: Text(menu.name),
              subtitle: Text('Takes ${menu.price} Price'),
            ),
            FlatButton.icon(
              padding: EdgeInsets.only(right: 250),
              label: Text('add Photo'),
              icon: Icon(Icons.camera),
              onPressed: () {
                getImage();
              },
            ),
          ],
        ),
      ),
    );
  }
}
