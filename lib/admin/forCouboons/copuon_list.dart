import 'package:flutter/material.dart';
import 'package:miskapp/admin/forCouboons/coupon_tile.dart';
import 'package:miskapp/module/coupon.dart';
import 'package:provider/provider.dart';

class CouponList extends StatefulWidget {
  @override
  _CouponListState createState() => _CouponListState();
}

class _CouponListState extends State<CouponList> {
  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<User>(context);
    final coupon = Provider.of<List<Coupon>>(context) ?? [];
    return ListView.builder(
      itemCount: coupon.length,
      itemBuilder: (context, index) {
        return CouponTile(
          coupon: coupon[index],
        );
      },
    );
  }
}
