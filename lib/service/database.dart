// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:miskapp/module/chat.dart';
import 'package:miskapp/module/coupon.dart';
import 'package:miskapp/module/item.dart';
import 'package:miskapp/module/menu.dart';
import 'package:miskapp/module/card.dart';
import 'package:miskapp/module/new_order.dart';
import 'package:miskapp/module/rate.dart';
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

  final CollectionReference couponCollection =
      Firestore.instance.collection('coupon');

  final CollectionReference newOrderCollection =
      Firestore.instance.collection('newOrder');

  final CollectionReference chatCollection =
      Firestore.instance.collection('chat');

  final CollectionReference rateCollection =
      Firestore.instance.collection('rate');

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
    bool isActive,
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
      'isActive': isActive,
      'image': '',
      'latitude': 0.0,
      'longitude': 0.0
    });
  }

  Future<void> updateImageUserData(
    String image,
  ) async {
    return await userCollection.document(uid).updateData({
      'image': image,
    });
  }

  Future<void> setRate(int rate, String id, String rateWhat) async {
    return await rateCollection.document(id).setData(
      {
        '$rateWhat': rate,
      },
    );
  }

  Future<void> updateRate(int rate, String id, String rateWhat) async {
    return await rateCollection.document(id).setData(
      {
        '$rateWhat': rate,
      },
    );
  }

  Future<void> updateStateOfOrder(
    String id,
    bool state,
  ) async {
    return await newOrderCollection.document(id).updateData({
      'state': !state,
    });
  }

  Future<void> updateAcceptOfOrder(
    String id,
    bool state,
  ) async {
    return await newOrderCollection.document(id).updateData({
      'accept': !state,
    });
  }

  Future<void> updateWhatOfOrder(
    String id,
    String what,
    dynamic state,
  ) async {
    return await newOrderCollection.document(id).updateData({
      '$what': state,
    });
  }

  Future<void> updateLocationUserData(double lati, double longi) async {
    return await userCollection.document(uid).updateData({
      'latitude': lati,
      'longitude': longi,
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

  Future<void> updateChatData(
      String sender, String receiver, String orderId, String message) async {
    return await chatCollection.document().setData({
      'sender': sender,
      'receiver': receiver,
      'orderId': orderId,
      'message': message,
    });
  }

  Future<void> updateNewOrderData(
      List allOrder,
      String customerId,
      String marketId,
      String pay,
      String notis,
      String time,
      bool driveIt,
      double total) async {
    return await newOrderCollection.document().setData({
      'allOrder': allOrder,
      'customerId': customerId,
      'marketId': marketId,
      'pay': pay,
      'notis': notis,
      'time': time,
      'driveIt': driveIt,
      'total': total,
      'state': true,
      'accept': false,
      'tikeIt': false,
      'toDriver': false,
      'ready': false,
      'tikeItDriver': false
    });
  }

  Future<void> updateCouponData(int number, String name) async {
    return await couponCollection.document().setData({
      'number': number,
      'name': name,
    });
  }

  Future<void> updatemenuImage(String image, String id) async {
    return await menuCollection.document(id).updateData({'image': image});
  }

  Future<void> updateUserActive(bool isActive, String id) async {
    return await userCollection.document(id).updateData({'isActive': isActive});
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

  List<Rate> _rateListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      //print(doc.data);
      return Rate(
          customerRateDriver: doc.data['customerRateDriver'] ?? 0,
          customerRateMarket: doc.data['customerRateMarket'] ?? 0,
          drivrtRateCustomer: doc.data['drivrtRateCustomer'] ?? 0,
          marketRateCustomer: doc.data['marketRateCustomer'] ?? 0,
          rateId: doc.documentID);
    }).toList();
  }

  List<Chat> _chatListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Chat(
        sender: doc.data['sender'] ?? '',
        receiver: doc.data['receiver'] ?? '',
        message: doc.data['message'] ?? '',
        orderId: doc.data['orderId'] ?? '',
        idOfChat: doc.documentID,
      );
    }).toList();
  }

  List<NewOrder> _newOrderListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return NewOrder(
        allOrder: doc.data['allOrder'] ?? [],
        customerId: doc.data['customerId'] ?? '',
        marketId: doc.data['marketId'] ?? '',
        pay: doc.data['pay'] ?? '',
        notis: doc.data['notis'] ?? '',
        time: doc.data['time'] ?? '',
        driveIt: doc.data['driveIt'] ?? false,
        total: doc.data['total'] ?? 0.0,
        idOfOrder: doc.documentID,
        state: doc.data['state'] ?? false,
        accept: doc.data['accept'] ?? false,
        tikeIt: doc.data['tikeIt'] ?? false,
        toDriver: doc.data['toDriver'] ?? false,
        ready: doc.data['ready'] ?? false,
        tikeItDriver: doc.data['tikeItDriver'] ?? false,
        driverId: doc.data['driverId'] ?? '',
      );
    }).toList();
  }

  List<Coupon> _couponListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Coupon(
        number: doc.data['number'] ?? 0,
        name: doc.data['name'] ?? '',
        idOfCoupon: doc.documentID,
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
          idOfCart: doc.documentID);
    }).toList();
  }

  // item list from snapshot
  List<Item> _itemListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      //print(doc.data);
      return Item(
        id: doc.data['idUser'] ?? ' ',
        name: doc.data['name'] ?? ' ',
        email: doc.data['email'] ?? ' ',
        phone: doc.data['phone'] ?? 0,
        sity: doc.data['sity'] ?? ' ',
        isCustomer: doc.data['isCustomer'] ?? false,
        isMarket: doc.data['isMarket'] ?? false,
        isDriver: doc.data['isDriver'] ?? false,
        isAdmin: doc.data['isAdmin'] ?? false,
        isActive: doc.data['isActive'] ?? false,
        image: doc.data['image'] ?? ' ',
        latitude: doc.data['latitude'] ?? 0.0,
        longitude: doc.data['longitude'] ?? 0.0,
      );
    }).toList();
  }

  // get  stream
  Stream<List<Menu>> get menus {
    return menuCollection.snapshots().map(_menuListFromSnapshot);
  }

  Stream<List<Rate>> get rate {
    return rateCollection.snapshots().map(_rateListFromSnapshot);
  }

  Stream<List<Chat>> get chats {
    return chatCollection.snapshots().map(_chatListFromSnapshot);
  }

  Stream<List<NewOrder>> get newOrder {
    return newOrderCollection.snapshots().map(_newOrderListFromSnapshot);
  }

// new
  Stream<List<Cardd>> get cards {
    return cardCollection.snapshots().map(_cardListFromSnapshot);
  }

  Stream<List<Item>> get items {
    return userCollection.snapshots().map(_itemListFromSnapshot);
  }

  Stream<List<Coupon>> get coupon {
    return couponCollection.snapshots().map(_couponListFromSnapshot);
  }

  // get market stream
  Stream<QuerySnapshot> get info {
    return userCollection.snapshots();
  }

  Stream<QuerySnapshot> get rates {
    return rateCollection.snapshots();
  }

  Stream<QuerySnapshot> get chat {
    return chatCollection.snapshots();
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
      isActive: snapshot.data['isActive'],
      image: snapshot.data['image'],
      latitude: snapshot.data['latitude'] ?? 0,
      longitude: snapshot.data['longitude'] ?? 0,
    );
  }

  ChatDate _chatDataFromSnapshot(DocumentSnapshot snapshot) {
    return ChatDate(
      sender: snapshot.data['sender'],
      receiver: snapshot.data['receiver'],
      orderId: snapshot.data['orderId'],
      message: snapshot.data['message'],
      idOfChat: snapshot.documentID,
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

  NewOrderData _newOrderDataFromSnapshot(DocumentSnapshot snapshot) {
    return NewOrderData(
        allOrder: snapshot.data['allOrder'],
        customerId: snapshot.data['customerId'],
        marketId: snapshot.data['marketId'],
        pay: snapshot.data['pay'],
        notis: snapshot.data['notis'],
        driveIt: snapshot.data['driveIt'],
        time: snapshot.data['time'],
        total: snapshot.data['total'],
        state: snapshot.data['state'],
        idOfOrder: snapshot.documentID);
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

  RateData _rateDataFromSnapshot(DocumentSnapshot snapshot) {
    return RateData(
        customerRateDriver: snapshot.data['customerRateDriver'],
        customerRateMarket: snapshot.data['customerRateMarket'],
        drivrtRateCustomer: snapshot.data['drivrtRateCustomer'],
        marketRateCustomer: snapshot.data['marketRateCustomer'],
        rateId: snapshot.documentID);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return userCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }

  Stream<RateData> get rateData {
    return rateCollection.document(uid).snapshots().map(_rateDataFromSnapshot);
  }

  Stream<MenuData> get menuData {
    return menuCollection.document(uid).snapshots().map(_menuDataFromSnapshot);
  }

  // new
  Stream<CardData> get cardData {
    return cardCollection.document(uid).snapshots().map(_cardDataFromSnapshot);
  }

  Stream<ChatDate> get chatData {
    return cardCollection.document(uid).snapshots().map(_chatDataFromSnapshot);
  }

  Stream<NewOrderData> get newOrderData {
    return newOrderCollection
        .document(uid)
        .snapshots()
        .map(_newOrderDataFromSnapshot);
  }
}
