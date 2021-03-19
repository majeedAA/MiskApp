import 'package:flutter/material.dart';
import 'package:miskapp/module/user.dart';
import 'package:miskapp/service/database.dart';
import 'package:miskapp/shared/loding.dart';
import 'package:provider/provider.dart';

class SettingsItem extends StatefulWidget {
  @override
  _SettingsItemState createState() => _SettingsItemState();
}

class _SettingsItemState extends State<SettingsItem> {
  final _formKey = GlobalKey<FormState>();

  String _currentName;
  String _currentCaticury;
  double _currentPrice;
  String _currentUnit;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            'Update your Menu settings.',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            // initialValue: menuData.name,
            decoration: InputDecoration(
              //  border: OutlineInputBorder(),
              labelText: 'Name',
            ),
            validator: (val) => val.isEmpty ? 'Please enter a name' : null,
            onChanged: (val) => setState(() => _currentName = val),
          ),
          SizedBox(height: 10.0),
          TextFormField(
            validator: (val) => val.isEmpty ? 'Enter Caticury' : null,
            //initialValue: menuData.caticury,
            decoration: InputDecoration(
              labelText: 'Caticury',
            ),
            onChanged: (val) => setState(() {
              _currentCaticury = val;
            }),
          ),
          SizedBox(height: 10.0),
          TextFormField(
            validator: (val) => val.isEmpty ? 'Enter Unit' : null,
            //initialValue: menuData.unet,
            decoration: InputDecoration(
              labelText: 'Unit',
            ),
            // keyboardType:
            //     TextInputType.numberWithOptions(decimal: true),
            // inputFormatters: <TextInputFormatter>[
            //   FilteringTextInputFormatter.digitsOnly
            // ],
            onChanged: (val) => setState(() {
              _currentUnit = val;
            }),
          ),
          SizedBox(height: 10.0),
          TextFormField(
            validator: (val) => val.isEmpty ? 'Enter Price' : null,
            // initialValue: menuData.price.toString(),
            decoration: InputDecoration(
              labelText: 'Price',
            ),
            onChanged: (val) => setState(() {
              _currentPrice = double.parse(val);
            }),
          ),
          SizedBox(height: 10.0),
          RaisedButton(
              color: Color(0xff515c5e),
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  await DatabaseService(uid: user.uid).updatemenuData(
                    user.uid ?? '',
                    _currentName ?? '',
                    _currentUnit ?? '',
                    _currentPrice ?? 0.0,
                    _currentCaticury ?? '',
                  );

                  // await DatabaseService(uid: user.uid).updatemenuData(
                  //   _currentName ?? snapshot.data.name,
                  //   _currentUnit ?? snapshot.data.unet,
                  //   _currentPrice ?? snapshot.data.price,
                  //   _currentCaticury ?? snapshot.data.caticury,
                  //       );
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
