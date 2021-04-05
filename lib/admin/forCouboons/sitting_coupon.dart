import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miskapp/module/user.dart';
import 'package:miskapp/service/database.dart';
import 'package:miskapp/shared/loding.dart';
import 'package:provider/provider.dart';

class SittingOfCoupon extends StatefulWidget {
  @override
  _SittingOfCouponState createState() => _SittingOfCouponState();
}

class _SittingOfCouponState extends State<SittingOfCoupon> {
  final _formKey = GlobalKey<FormState>();
  String nameOfCouboon;
  int prisint;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            'Add new coupon.',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            validator: (val) => val.isEmpty ? 'Enter Name' : null,
            initialValue: '',
            cursorColor: Colors.black,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'set name to new couboon:',
            ),
            onChanged: (val) {
              nameOfCouboon = val;
            },
          ),
          SizedBox(height: 10.0),
          TextFormField(
            validator: (val) => 0 > int.parse(val) && int.parse(val) > 100
                ? 'Enter number between 0 and 100'
                : null,
            initialValue: '',
            cursorColor: Colors.black,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'How miny:',
            ),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            onChanged: (val) {
              prisint = int.parse(val);
            },
          ),
          SizedBox(height: 10.0),
          RaisedButton(
              color: Color(0xff515c5e),
              child: Text(
                'Add couboon',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  await DatabaseService(uid: user.uid)
                      .updateCouponData(prisint, nameOfCouboon);

                  Navigator.pop(context);
                } else {
                  return Loading();
                }
              }),
        ],
      ),
    );
  }
}
