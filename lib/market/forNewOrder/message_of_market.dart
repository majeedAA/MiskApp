import 'package:flutter/material.dart';
import 'package:miskapp/market/forNewOrder/list_of_message.dart';
import 'package:miskapp/market/forNewOrder/message_tile_market.dart';
import 'package:miskapp/module/chat.dart';
import 'package:miskapp/module/item.dart';
import 'package:miskapp/module/new_order.dart';
import 'package:miskapp/module/user.dart';
import 'package:miskapp/service/database.dart';
import 'package:provider/provider.dart';

class MessageOfMarket extends StatefulWidget {
  NewOrder order;
  MessageOfMarket({this.order});
  @override
  _MessageOfMarketState createState() => _MessageOfMarketState();
}

class _MessageOfMarketState extends State<MessageOfMarket> {
  final _controller = TextEditingController();
  String message = '';
  @override
  Widget build(BuildContext context) {
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
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height / 1.215,
                            child: ListOfMessageMarket(
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

// StreamProvider<List<Chat>>.value(
//         value: DatabaseService().chats,
//         builder: (context, snapshot) {
//           return Scaffold(
//             appBar: AppBar(
//               title: Text('Chat'),
//             ),

//           );
//         });
