import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miskapp/module/user.dart';
import 'package:miskapp/service/database.dart';
import 'package:miskapp/shared/loding.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> cities = [
    'Riyadh',
    'Jiddah',
    'Mecca',
    'Buraydah',
    'Al-Khubar',
    'Al-Dammam',
    'Medina',
    'Najran',
    'Tabuk'
  ];

  // form values
  String _currentName;
  String _currentEmail;
  int _currentPhone;
  String _currentCity;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  Text(
                    'Update your Account settings.',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    initialValue: userData.name,
                    decoration: InputDecoration(
                      //  border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                    validator: (val) =>
                        val.isEmpty ? 'Please enter a name' : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    validator: (val) => val.isEmpty ? 'Enter Email' : null,
                    initialValue: userData.email,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    onChanged: (val) => setState(() {
                      _currentEmail = val;
                    }),
                  ),
                  SizedBox(height: 10.0),
                  DropdownButtonFormField(
                    value: _currentCity ?? 'Riyadh',
                    decoration: InputDecoration(
                      labelText: 'City',
                    ),
                    items: cities.map((city) {
                      return DropdownMenuItem(
                        value: city,
                        child: Text(city),
                      );
                    }).toList(),
                    onChanged: (val) => setState(() => _currentCity = val),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    validator: (val) => val.isEmpty ? 'Enter phone' : null,
                    initialValue: userData.phone.toString(),
                    decoration: InputDecoration(
                      labelText: 'phone',
                    ),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (val) => setState(() {
                      var preice = int.parse(val);
                      _currentPhone = preice;
                    }),
                  ),
                  SizedBox(height: 10.0),
                  RaisedButton(
                      color: Color(0xff515c5e),
                      child: Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          await DatabaseService(uid: user.uid).updateUserData(
                              user.uid,
                              _currentCity ?? snapshot.data.sity,
                              _currentName ?? snapshot.data.name,
                              _currentEmail ?? snapshot.data.email,
                              _currentPhone ?? snapshot.data.phone,
                              snapshot.data.isCustomer,
                              snapshot.data.isMarket,
                              snapshot.data.isDriver,
                              false ?? false,
                              snapshot.data.isActive);
                          Navigator.pop(context);
                        }
                      }),
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
