import 'package:flutter/material.dart';
import 'package:miskapp/customer/forOrders/list_message_with_driver.dart';
import 'package:miskapp/module/chat.dart';
import 'package:miskapp/module/item.dart';
import 'package:miskapp/module/new_order.dart';
import 'package:miskapp/module/user.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';

class CustomerChatWithDriver extends StatefulWidget {
  final NewOrder order;

  CustomerChatWithDriver({
    this.order,
  });
  @override
  _CustomerChatWithDriverState createState() => _CustomerChatWithDriverState();
}

class _CustomerChatWithDriverState extends State<CustomerChatWithDriver> {
  final _controller = TextEditingController();

  String message = '';
  int rate = 1;

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
                    print(rate);
                    // if (widget.order.driveIt == false) {
                    await DatabaseService().updateRate(
                        rate, widget.order.idOfOrder, 'customerRateDriver');
                    // }
                    // if (widget.order.driveIt) {
                    //   await DatabaseService().updateWhatOfOrder(
                    //       widget.order.idOfOrder, 'tikeIt', true);
                    // }
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });
    }

    final user = Provider.of<User>(context);
    return StreamProvider<List<Item>>.value(
        value: DatabaseService().items,
        child: StreamProvider<List<Chat>>.value(
            value: DatabaseService().chats,
            builder: (context, snapshot) {
              return MaterialApp(
                home: DefaultTabController(
                  length: 1,
                  child: Scaffold(
                    backgroundColor: Colors.indigo[50],
                    appBar: AppBar(
                      actions: [
                        IconButton(
                            icon: Icon(
                              Icons.star,
                              color: Colors.blue[50],
                            ),
                            onPressed: () {
                              openrate();
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (BuildContext context) =>
                              //           MessageOfMarket(
                              //             order: order,
                              //           )),
                              // );
                            }),
                        IconButton(
                            icon: Icon(Icons.arrow_forward_ios_rounded),
                            onPressed: () => Navigator.pop(context))
                      ],
                      title: Text(
                        'Live Chat',
                        style: TextStyle(color: Color(0xffffffff)),
                      ),
                      backgroundColor: Colors.cyan[200],
                    ),
                    body: SafeArea(
                      child: ListView(
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height / 1.215,
                            child: ListMessageWithDriver(
                              order: widget.order,
                            ),
                          ), //one
                          Container(
                            height: 65.5,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: TextField(
                                    controller: _controller,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    autocorrect: true,
                                    enableSuggestions: true,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.grey[100],
                                      labelText: 'Type your message',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(width: 0),
                                        gapPadding: 10,
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                    ),
                                    onChanged: (value) => setState(() {
                                      message = value;
                                    }),
                                  ),
                                ),
                                SizedBox(width: 20),
                                GestureDetector(
                                  onTap: () async {
                                    if (message.trim().isNotEmpty) {
                                      await DatabaseService().updateChatData(
                                          user.uid,
                                          widget.order.customerId,
                                          widget.order.idOfOrder,
                                          message);
                                      _controller.clear();
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue,
                                    ),
                                    child:
                                        Icon(Icons.send, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          )
                          //tow
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
