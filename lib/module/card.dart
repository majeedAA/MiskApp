import 'package:flutter/material.dart';

class Cardd {
  final String idCustomer;
  final String idMarket;
  final String idDriver;
  final String nameOfItem;
  final int quantity;
  final double price;
  final double totalprice;

  Cardd({
    this.idCustomer,
    this.idMarket,
    this.idDriver,
    this.nameOfItem,
    this.quantity,
    this.price,
    this.totalprice,
  });
}

class CardData {
  final String idCustomer;
  final String idMarket;
  final String idDriver;
  final String nameOfItem;
  final double quantity;
  final double price;
  final double totalprice;
  CardData(
      {this.idCustomer,
      this.idMarket,
      this.idDriver,
      this.nameOfItem,
      this.quantity,
      this.price,
      this.totalprice});
}
