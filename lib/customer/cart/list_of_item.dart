import 'package:flutter/material.dart';
import 'package:miskapp/customer/cart/cart_customer.dart';
import 'package:miskapp/customer/cart/card_tile.dart';
import 'package:miskapp/market/process/item_tile.dart';
import 'package:miskapp/module/card.dart';
import 'package:miskapp/module/menu.dart';
import 'package:miskapp/module/user.dart';
import 'package:provider/provider.dart';

class CardList extends StatefulWidget {
  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  double total = 0;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final card = Provider.of<List<Cardd>>(context) ?? [];
    return ListView.builder(
      itemCount: card.length,
      itemBuilder: (context, index) {
        user.uid == card[index].idCustomer
            ? total = total + card[index].totalprice
            : null;

        return user.uid == card[index].idCustomer
            ? CardTile(
                card: card[index],
              )
            : Container();
      },
    );
  }
}
