import 'package:flutter/material.dart';
import 'package:miskapp/module/item.dart';
import 'package:miskapp/module/new_order.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';

class CustomerDitils extends StatefulWidget {
  final NewOrder order;
  CustomerDitils({this.order});

  @override
  _CustomerDitilsState createState() => _CustomerDitilsState();
}

class _CustomerDitilsState extends State<CustomerDitils> {
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
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('No')),
              FlatButton(
                child: Text('yes'),
                onPressed: () async {
                  if (widget.order.driveIt == false) {
                    await DatabaseService()
                        .updateStateOfOrder(widget.order.idOfOrder, true);
                  }
                  if (widget.order.driveIt) {
                    await DatabaseService().updateWhatOfOrder(
                        widget.order.idOfOrder, 'tikeIt', true);
                  }
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  Color colorOfReady = Colors.black;

  @override
  Widget build(BuildContext newcontext) {
    String name = '';
    int phone = 0;
    if (widget.order.ready || widget.order.toDriver) {
      colorOfReady = Colors.green[900];
    }
    final customer = Provider.of<List<Item>>(newcontext) ?? [];
    for (var i = 0; i < customer.length; i++) {
      if (widget.order.customerId == customer[i].id) {
        name = customer[i].name;
        phone = customer[i].phone;
        break;
      }
    }
    return Container(
      color: Colors.white,
      height: 60,
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.account_circle_outlined,
            color: Colors.blue[700],
          ),
          SizedBox(
            width: 10,
          ),
          Text(name),
          SizedBox(
            width: 40,
          ),
          Icon(
            Icons.phone,
            color: Colors.blue[700],
          ),
          SizedBox(
            width: 10,
          ),
          Text(phone.toString()),
          SizedBox(
            width: 30,
          ),
          Text('|'),
          SizedBox(
            width: 15,
          ),
          GestureDetector(
            child: Text(
              'ready',
              style:
                  TextStyle(color: colorOfReady, fontWeight: FontWeight.w800),
            ),
            onTap: () async {
              if (widget.order.driveIt) {
                await DatabaseService().updateWhatOfOrder(
                    widget.order.idOfOrder, 'toDriver', true);
              }
              if (!widget.order.driveIt) {
                await DatabaseService()
                    .updateWhatOfOrder(widget.order.idOfOrder, 'ready', true);
              }
            },
          ),
          SizedBox(
            width: 20,
          ),
          Text('|'),
          SizedBox(
            width: 20,
          ),
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
    );
  }
}
