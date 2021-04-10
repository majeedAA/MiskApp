import 'package:flutter/material.dart';
import 'package:miskapp/customer/processCus/items_market.dart';
import 'package:miskapp/market/forNewOrder/page_of_order.dart';
import 'package:miskapp/module/new_order.dart';
import 'package:miskapp/service/database.dart';

class NewOrderMarketTile extends StatefulWidget {
  final double marketLati;
  final double marketLongi;
  final NewOrder order;
  NewOrderMarketTile({this.order, this.marketLati, this.marketLongi});

  @override
  _NewOrderMarketTileState createState() => _NewOrderMarketTileState();
}

class _NewOrderMarketTileState extends State<NewOrderMarketTile> {
  double latitude = 0;

  double longtude = 0;

  String cusrmerID;

  String driveIt;

  @override
  Widget build(BuildContext context) {
    driveIt = widget.order.driveIt ? 'Delivery' : 'PickUp';

    cusrmerID =
        widget.order.customerId.substring(widget.order.customerId.length - 6);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => PageOfOrder(
                    order: widget.order,
                    marketLati: widget.marketLati,
                    marketLongi: widget.marketLongi,
                  )),
        );
      },
      child: Container(
        color: widget.order.accept ? Colors.green : Colors.red,
        height: 130,
        padding: const EdgeInsets.only(top: 8.0),
        margin: EdgeInsets.only(bottom: 5),
        child: Card(
          margin: EdgeInsets.fromLTRB(10.0, 7.0, 10.0, 7.0),
          child: Column(
            children: [
              ListTile(
                title: Text('New order by $cusrmerID'),
                subtitle: Text(
                    '${widget.order.total}SAR \n$driveIt ${widget.order.time} '),
              ),
              Row(
                children: [
                  Visibility(
                    visible: !widget.order.accept,
                    child: FlatButton.icon(
                        onPressed: () async {
                          await DatabaseService().updateAcceptOfOrder(
                              widget.order.idOfOrder, widget.order.accept);
                        },
                        icon: Icon(Icons.add_circle_sharp),
                        label: Text('accept')),
                  ),
                  SizedBox(
                    width: 130,
                  ),
                  Visibility(
                    visible: !widget.order.accept,
                    child: FlatButton.icon(
                        onPressed: () async {
                          await DatabaseService().updateStateOfOrder(
                              widget.order.idOfOrder, widget.order.state);
                        },
                        icon: Icon(Icons.remove_circle),
                        label: Text('reject')),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
