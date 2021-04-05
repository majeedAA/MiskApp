import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:miskapp/module/coupon.dart';

class CouponTile extends StatelessWidget {
  final Coupon coupon;
  CouponTile({
    this.coupon,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        color: Colors.blue[50],
        child: ListTile(
          trailing: FlatButton.icon(
            onPressed: () async {
              await Firestore.instance
                  .collection('coupon')
                  .document(coupon.idOfCoupon)
                  .delete();
            },
            icon: Icon(Icons.remove_circle_outline_outlined),
            label: Text(''),
          ),
          title: Text('     ${coupon.name}'),
          subtitle: Text('      have ${coupon.number}% discount'),
        ),
      ),
    );
  }
}
