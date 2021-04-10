import 'package:flutter/material.dart';
import 'package:miskapp/admin/process/rate_tile.dart';
import 'package:miskapp/module/rate.dart';
import 'package:provider/provider.dart';

class ListOfRateAdmin extends StatefulWidget {
  @override
  _ListOfRateAdminState createState() => _ListOfRateAdminState();
}

class _ListOfRateAdminState extends State<ListOfRateAdmin> {
  @override
  Widget build(BuildContext context) {
    final rate = Provider.of<List<Rate>>(context) ?? [];
    return ListView.builder(
      itemCount: rate.length,
      itemBuilder: (conbtext, index) {
        return AllRateTile(
          rate: rate[index],
        );
      },
    );
  }
}
