import 'package:flutter/material.dart';
import 'package:miskapp/customer/cart/card_tile.dart';
import 'package:miskapp/customer/forOrders/chat_with_driver.dart';
import 'package:miskapp/customer/forOrders/page_of_order.dart';
import 'package:miskapp/module/item.dart';
import 'package:miskapp/module/new_order.dart';
import 'package:provider/provider.dart';

class OrdersOfCustomer extends StatefulWidget {
  final NewOrder order;
  OrdersOfCustomer({
    this.order,
  });
  @override
  _OrdersOfCustomerState createState() => _OrdersOfCustomerState();
}

class _OrdersOfCustomerState extends State<OrdersOfCustomer> {
  String driveIt;
  String marketName = '';
  Item market;
  Item customer;
  @override
  Widget build(BuildContext context) {
    String time =
        widget.order.time.isEmpty ? 'Any Time' : widget.order.time.toString();

    String orederWith = widget.order.tikeIt ? 'with Driver' : 'with market';
    driveIt = widget.order.driveIt ? 'drive' : 'bickUp';
    final users = Provider.of<List<Item>>(context) ?? [];

    for (var i = 0; i < users.length; i++) {
      if (users[i].id == widget.order.marketId) {
        market = users[i];
        marketName = users[i].name;
      }
      if (users[i].id == widget.order.customerId) {
        customer = users[i];
      }
    }
    return GestureDetector(
      onTap: () {
        if (widget.order.tikeIt) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => CustomerChatWithDriver(
                      order: widget.order,
                    )),
          );
        }
        if (!widget.order.tikeIt) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => CustomerChatWithMarket(
                      order: widget.order,
                    )),
          );
        }
      },
      child: Container(
        color: widget.order.accept
            ? widget.order.state
                ? Colors.green[800]
                : Colors.grey[700]
            : Colors.red[900],
        height: 110,
        padding: const EdgeInsets.only(top: 6.0, bottom: 6),
        margin: EdgeInsets.only(bottom: 2, top: 5),
        child: Card(
          margin: EdgeInsets.fromLTRB(10.0, 7.0, 10.0, 7.0),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  '$marketName',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                    '${widget.order.total}SAR \n$driveIt $time \n$orederWith'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
