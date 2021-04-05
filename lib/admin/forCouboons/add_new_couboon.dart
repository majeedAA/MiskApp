import 'package:flutter/material.dart';
import 'package:miskapp/admin/forCouboons/sitting_coupon.dart';

class AddNewCouboon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SittingOfCoupon(),
            );
          });
    }

    return Expanded(
      child: Container(
        padding: EdgeInsets.all(7),
        color: Color(0xffffffff),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
              child: FloatingActionButton(
                  backgroundColor: Colors.indigo[700],
                  child: Text("Add couboon"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onPressed: () {
                    _showSettingsPanel();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
