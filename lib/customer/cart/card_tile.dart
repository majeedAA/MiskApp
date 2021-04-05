import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:miskapp/module/card.dart';

final userRef = Firestore.instance.collection('card');

class CardCustomerTile extends StatelessWidget {
  final Cardd card;
  CardCustomerTile({
    this.card,
  });

  String idItem = '';
  getUsers(Cardd card) {
    userRef.getDocuments().then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((element) {
        if (card.nameOfItem == element.data.values.elementAt(1) &&
            card.quantity == element.data.values.elementAt(0)) {
          idItem = element.documentID;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    getUsers(card);

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        color: Colors.blue[50],
        child: ListTile(
          trailing: FlatButton.icon(
            onPressed: () async {
              await Firestore.instance
                  .collection('card')
                  .document(idItem)
                  .delete();
            },
            icon: Icon(Icons.remove_circle_outline_outlined),
            label: Text(''),
          ),
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[100],
          ),
          title: Text(card.nameOfItem),
          subtitle: Text('price: ' +
              card.price.toString() +
              ' \nQuantity: ' +
              card.quantity.toString() +
              ' \nTotal preice: ' +
              card.totalprice.toString() +
              ' SAR '),
        ),
      ),
    );
  }
}
