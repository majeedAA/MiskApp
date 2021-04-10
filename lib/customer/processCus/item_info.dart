import 'package:flutter/material.dart';
import 'package:miskapp/customer/processCus/setting_add_card.dart';
import 'package:miskapp/module/menu.dart';

class ItemInfo extends StatelessWidget {
  final Menu menu;
  ItemInfo({this.menu});
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SittingAddToCard(
                  marketId: menu.id,
                  itemName: menu.name,
                  itemCatigory: menu.caticury,
                  itemUnit: menu.unit,
                  itemPrice: menu.price),
            );
          });
    }

    return GestureDetector(
      onTap: () => _showSettingsPanel(),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25,
              child: ClipOval(
                child: SizedBox(
                  width: 300,
                  height: 3000,
                  child: menu.image.isEmpty
                      ? Container()
                      : Image.network(menu.image ?? ''),
                ),
              ),
            ),
            title: Text(menu.name),
            subtitle: Text('Takes ${menu.price} Price\n1 ${menu.unit}'),
          ),
        ),
      ),
    );
  }
}
