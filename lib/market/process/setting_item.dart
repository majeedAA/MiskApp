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
  String _currentCategory;
  double _currentPrice;
  String _currentUnit;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          Text(
            'Add item',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Name',
            ),
            validator: (val) => val.isEmpty ? 'Please enter a name' : null,
            onChanged: (val) => setState(() => _currentName = val),
          ),
          SizedBox(height: 10.0),
          TextFormField(
            validator: (val) => val.isEmpty ? 'Enter Category' : null,
            decoration: InputDecoration(
              labelText: 'Category',
            ),
            onChanged: (val) => setState(() {
              _currentCategory = val;
            }),
          ),
          SizedBox(height: 10.0),
          TextFormField(
            validator: (val) => val.isEmpty ? 'Enter Unit' : null,
            decoration: InputDecoration(
              labelText: 'Unit',
            ),
            onChanged: (val) => setState(() {
              _currentUnit = val;
            }),
          ),
          SizedBox(height: 10.0),
          TextFormField(
            validator: (val) => val.isEmpty ? 'Enter Price' : null,
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
                    _currentCategory ?? '',
                  );
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
