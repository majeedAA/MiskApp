import 'package:flutter/material.dart';

class User {
  final String uid;
  User({this.uid});
}

class UserData {
  final String uid;
  final String name;
  final String sity;
  final String email;
  final int phone;
  final bool isCustomer;
  final bool isMarket;
  final bool isDriver;
  final bool isAdmin;

  UserData(
      {this.uid,
      this.name,
      this.sity,
      this.email,
      this.phone,
      this.isCustomer,
      this.isMarket,
      this.isDriver,
      this.isAdmin});
}

class MenuData {
  final String id;
  final String name;
  final String unet;
  final String caticury;
  final double price;

  MenuData({this.id, this.name, this.unet, this.caticury, this.price});
}
