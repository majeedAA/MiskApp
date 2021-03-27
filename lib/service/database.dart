// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:miskapp/module/item.dart';
import 'package:miskapp/module/menu.dart';
import 'package:miskapp/module/card.dart';
import 'package:miskapp/module/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  final CollectionReference menuCollection =
      Firestore.instance.collection('menu');

  final CollectionReference cardCollection =
      Firestore.instance.collection('card');

  Future<void> updateUserData(
    String id,
    String sity,
    String name,
    String email,
    int phone,
    bool isCustomer,
    bool isMarket,
    bool isDriver,
    bool isAdmin,
  ) async {
    return await userCollection.document(uid).setData({
      'idUser': id,
      'sity': sity,
      'name': name,
      'email': email,
      'phone': phone,
      'isCustomer': isCustomer,
      'isMarket': isMarket,
      'isDriver': isDriver,
      'isAdmin': isAdmin,
      'image': ''
    });
  }

  Future<void> updateImageUserData(
    String image,
  ) async {
    return await userCollection.document(uid).updateData({
      'image': image,
    });
  }

  Future<void> updatemenuData(String id, String name, String unit, double price,
      String caticury) async {
    return await menuCollection.document().setData({
      'idMarket': id,
      'name': name,
      'unit': unit,
      'price': price,
      'caticury': caticury,
      'image': ''
    });
  }

  Future<void> updatemenuImage(String image, String id) async {
    return await menuCollection.document(id).updateData({'image': image});
  }

//new
  Future<void> updatCardData(
      String idCustomer,
      String idMarket,
      String idDriver,
      String nameOfItem,
      double totalprice,
      double price,
      int quantity) async {
    return await cardCollection.document().setData({
      'idCustomer': idCustomer,
      'nameOfItem': nameOfItem,
      'idMarket': idMarket,
      'idDriver': idDriver,
      'nameOfItem': nameOfItem,
      'totalprice': totalprice,
      'price': price,
      'quantity': quantity,
    });
  }

  List<Menu> _menuListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      //print(doc.data);
      return Menu(
        id: doc.data['idMarket'] ?? '',
        name: doc.data['name'] ?? '',
        unit: doc.data['unit'] ?? '',
        price: doc.data['price'] ?? 0.0,
        caticury: doc.data['caticury'] ?? '',
        image: doc.data['image'] ?? '',
        idItem: doc.documentID,
      );
    }).toList();
  }

  //new
  List<Cardd> _cardListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      //print(doc.data);
      return Cardd(
        idCustomer: doc.data['idCustomer'] ?? '',
        idMarket: doc.data['idMarket'] ?? '',
        idDriver: doc.data['idDriver'] ?? '',
        nameOfItem: doc.data['nameOfItem'] ?? '',
        quantity: doc.data['quantity'] ?? 0,
        price: doc.data['price'] ?? 0,
        totalprice: doc.data['totalprice'] ?? 0,
      );
    }).toList();
  }

  // item list from snapshot
  List<Item> _itemListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      //print(doc.data);
      return Item(
        id: doc.data['idUser'] ?? '',
        name: doc.data['name'] ?? '',
        email: doc.data['email'] ?? '',
        phone: doc.data['phone'] ?? 0,
        sity: doc.data['sity'] ?? '',
        isCustomer: doc.data['isCustomer'] ?? false,
        isMarket: doc.data['isMarket'] ?? false,
        isDriver: doc.data['isDriver'] ?? false,
        isAdmin: doc.data['isAdmin'] ?? false,
        image: doc.data['image'] ?? '',
      );
    }).toList();
  }

  // get  stream
  Stream<List<Menu>> get menus {
    return menuCollection.snapshots().map(_menuListFromSnapshot);
  }

// new
  Stream<List<Cardd>> get cards {
    return cardCollection.snapshots().map(_cardListFromSnapshot);
  }

  Stream<List<Item>> get items {
    return userCollection.snapshots().map(_itemListFromSnapshot);
  }

  // get market stream
  Stream<QuerySnapshot> get info {
    return userCollection.snapshots();
  }

//new
  // get market stream
  Stream<QuerySnapshot> get card {
    return cardCollection.snapshots();
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      id: snapshot.data['id'],
      name: snapshot.data['name'],
      phone: snapshot.data['phone'],
      email: snapshot.data['email'],
      sity: snapshot.data['sity'],
      isCustomer: snapshot.data['isCustomer'],
      isMarket: snapshot.data['isMarket'],
      isDriver: snapshot.data['isDriver'],
      isAdmin: snapshot.data['isAdmin'],
      image: snapshot.data['image'],
    );
  }

//new
  CardData _cardDataFromSnapshot(DocumentSnapshot snapshot) {
    return CardData(
      idCustomer: snapshot.data['idCustomer'],
      idMarket: snapshot.data['idMarket'],
      idDriver: snapshot.data['idDriver'],
      nameOfItem: snapshot.data['nameOfItem'],
      quantity: snapshot.data['quantity'],
      price: snapshot.data['price'],
    );
  }

  MenuData _menuDataFromSnapshot(DocumentSnapshot snapshot) {
    return MenuData(
      id: uid,
      name: snapshot.data['name'],
      unet: snapshot.data['unet'],
      caticury: snapshot.data['caticury'],
      price: snapshot.data['price'],
    );
  }

  // get user doc stream
  Stream<UserData> get userData {
    return userCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }

  Stream<MenuData> get menuData {
    return menuCollection.document(uid).snapshots().map(_menuDataFromSnapshot);
  }

  // new
  Stream<CardData> get cardData {
    return cardCollection.document(uid).snapshots().map(_cardDataFromSnapshot);
  }
}
