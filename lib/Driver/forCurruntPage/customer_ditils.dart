import 'package:flutter/material.dart';
import 'package:miskapp/module/item.dart';
import 'package:miskapp/module/new_order.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';

class CustomerDitilsDriver extends StatefulWidget {
  final NewOrder order;
  CustomerDitilsDriver({this.order});

  @override
  _CustomerDitilsDriverState createState() => _CustomerDitilsDriverState();
}

class _CustomerDitilsDriverState extends State<CustomerDitilsDriver> {
  @override
  Widget build(BuildContext context) {
    Future<void> openAlart() async {
      return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('End Order'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [Text('are you sure you want to end the order?')],
                ),
              ),
              actions: [
                FlatButton(
                  child: Text('No'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text('yes'),
                  onPressed: () async {
                    await DatabaseService()
                        .updateStateOfOrder(widget.order.idOfOrder, true);

                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });
    }

    String name = '';
    double lati = 0;
    double long = 0;
    int phone = 0;
    final customer = Provider.of<List<Item>>(context) ?? [];
    for (var i = 0; i < customer.length; i++) {
      if (widget.order.customerId == customer[i].id) {
        name = customer[i].name;
        phone = customer[i].phone;
        lati = customer[i].latitude;
        long = customer[i].longitude;
        break;
      }
    }
    return Container(
      color: Colors.white,
      height: 60,
      child: Expanded(
        child: Row(
          children: [
            // SizedBox(
            //   width: 10,
            // ),
            Icon(
              Icons.account_circle_outlined,
              color: Colors.blue,
            ),
            // SizedBox(
            //   width: 10,
            // ),
            Text(name),
            // SizedBox(
            //   width: 40,
            // ),
            Icon(Icons.phone),
            // SizedBox(
            //   width: 10,
            // ),
            Text(phone.toString()),
            // SizedBox(
            //   width: 25,
            // ),
            Text('|'),
            // SizedBox(
            //   width: 13,
            // ),
            GestureDetector(
              child: Text(
                'Take it',
                style: TextStyle(
                    color: Colors.green[900], fontWeight: FontWeight.w800),
              ),
              onTap: () async {
                await DatabaseService().updateWhatOfOrder(
                    widget.order.idOfOrder, 'tikeItDriver', true);
              },
            ),
            // SizedBox(
            //   width: 20,
            // ),
            Text('|'),
            // SizedBox(
            //   width: 20,
            // ),
            GestureDetector(
              child: Text(
                'Done',
                style: TextStyle(
                    color: Colors.blueGrey[900], fontWeight: FontWeight.w800),
              ),
              onTap: () {
                openAlart();
              },
            )
          ],
        ),
      ),
    );
  }
}
