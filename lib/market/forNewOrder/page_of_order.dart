import 'package:flutter/material.dart';
import 'package:miskapp/market/forNewOrder/customer_ditils.dart';
import 'package:miskapp/market/forNewOrder/ditils_of_order.dart';
import 'package:miskapp/market/forNewOrder/fot_loop_orders.dart';
import 'package:miskapp/market/forNewOrder/message_of_market.dart';
import 'package:miskapp/module/chat.dart';
import 'package:miskapp/module/item.dart';
import 'package:miskapp/module/new_order.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';

class PageOfOrder extends StatefulWidget {
  final NewOrder order;
  final double marketLati;
  final double marketLongi;

  PageOfOrder({this.order, this.marketLati, this.marketLongi});

  @override
  _PageOfOrderState createState() => _PageOfOrderState();
}

class _PageOfOrderState extends State<PageOfOrder> {
  int rate = 0;

  @override
  Widget build(BuildContext context) {
    Future<void> openrate() async {
      return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('RATE'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    Center(child: Text('Please rate customer:')),
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                            onPressed: () {
                              rate = 1;
                            }),
                        IconButton(
                            icon: Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                            onPressed: () {
                              rate = 2;
                            }),
                        IconButton(
                            icon: Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                            onPressed: () {
                              rate = 3;
                            }),
                        IconButton(
                            icon: Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                            onPressed: () {
                              rate = 4;
                            }),
                        IconButton(
                            icon: Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                            onPressed: () {
                              rate = 5;
                            }),
                      ],
                    )
                  ],
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
                    await DatabaseService().setRate(
                        rate, widget.order.idOfOrder, 'marketRateCustomer');

                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });
    }

    return StreamProvider<List<Item>>.value(
        value: DatabaseService().items,
        child: StreamProvider<List<Chat>>.value(
            value: DatabaseService().chats,
            builder: (context, snapshot) {
              return MaterialApp(
                home: DefaultTabController(
                  length: 1,
                  child: Scaffold(
                    backgroundColor: Colors.amber[50],
                    appBar: AppBar(
                      actions: [
                        IconButton(
                            icon: Icon(
                              Icons.star,
                              color: Colors.blue[50],
                            ),
                            onPressed: () {
                              openrate();
                            }),
                        IconButton(
                            icon: Icon(Icons.message),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        MessageOfMarket(
                                          order: widget.order,
                                        )),
                              );
                            }),
                        IconButton(
                            icon: Icon(Icons.arrow_forward_ios_rounded),
                            onPressed: () => Navigator.pop(context))
                      ],
                      title: Text(
                        'ORDER',
                        style: TextStyle(color: Color(0xffffffff)),
                      ),
                      backgroundColor: Colors.cyan[200],
                    ),
                    body: SafeArea(
                      child: Column(
                        children: <Widget>[
                          CustomerDitils(
                            order: widget.order,
                          ),
                          DitilsOfOrderMarket(
                            order: widget.order,
                          ),
                          Container(
                              color: Colors.deepPurple[50],
                              height: MediaQuery.of(context).size.height / 1.55,
                              child: ForLoopOrders(
                                order: widget.order,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
