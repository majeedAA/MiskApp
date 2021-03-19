import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:miskapp/module/item.dart';
import 'package:miskapp/module/menu.dart';
import 'package:miskapp/module/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  final CollectionReference menuCollection =
      Firestore.instance.collection('menu');

  Future<void> updateUserData(
      String id,
      String sity,
      String name,
      String email,
      int phone,
      bool isCustomer,
      bool isMarket,
      bool isDriver,
      bool isAdmin) async {
    return await userCollection.document(uid).setData({
      'id': id,
      'sity': sity,
      'name': name,
      'email': email,
      'phone': phone,
      'isCustomer': isCustomer,
      'isMarket': isMarket,
      'isDriver': isDriver,
      'isAdmin': isAdmin,
    });
  }

  Future<void> updatemenuData(String id, String name, String unit, double price,
      String caticury) async {
    return await menuCollection.document().setData({
      'id': id,
      'name': name,
      'unit': unit,
      'price': price,
      'caticury': caticury,
    });
  }

  List<Menu> _menuListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      //print(doc.data);
      return Menu(
        id: doc.data['id'] ?? '',
        name: doc.data['name'] ?? '',
        unit: doc.data['unit'] ?? '',
        price: doc.data['price'] ?? 0.0,
        caticury: doc.data['caticury'] ?? '',
      );
    }).toList();
  }

  // item list from snapshot
  List<Item> _itemListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      //print(doc.data);
      return Item(
        id: doc.data['id'] ?? '',
        name: doc.data['name'] ?? '',
        email: doc.data['email'] ?? '',
        phone: doc.data['phone'] ?? 0,
        sity: doc.data['sity'] ?? '',
        isCustomer: doc.data['isCustomer'] ?? false,
        isMarket: doc.data['isMarket'] ?? false,
        isDriver: doc.data['isDriver'] ?? false,
        isAdmin: doc.data['isAdmin'] ?? false,
      );
    }).toList();
  }

  // get brews stream
  Stream<List<Menu>> get menus {
    return menuCollection.snapshots().map(_menuListFromSnapshot);
  }

  Stream<List<Item>> get items {
    return userCollection.snapshots().map(_itemListFromSnapshot);
  }

  // get market stream
  Stream<QuerySnapshot> get info {
    return userCollection.snapshots();
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      phone: snapshot.data['phone'],
      email: snapshot.data['email'],
      sity: snapshot.data['sity'],
      isCustomer: snapshot.data['isCustomer'],
      isMarket: snapshot.data['isMarket'],
      isDriver: snapshot.data['isDriver'],
      isAdmin: snapshot.data['isAdmin'],
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
}
