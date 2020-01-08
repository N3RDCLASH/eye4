import 'package:eye4/style/theme.dart';
import 'package:eye4/models/item.dart';
import 'package:eye4/services/database.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:eye4/widgets/item_list.dart';

class Inventory extends StatefulWidget {
  @override
  InventoryState createState() => InventoryState();
}

class InventoryState extends State<Inventory> {
  //TEST FUnction with dummy data
  Future addListItems() async {
    await DatabaseService().setInventoryData(
        'CANON Speedlite 600EX-RT',
        '2424120473',
        'a supplier 2',
        DateTime.now(),
        200,
        "good",
        'a link',
        'an image link');
  }

  // List<Widget> _inventory = [];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamProvider<List<Item>>.value(
      value: DatabaseService().items,
      child: Scaffold(
        backgroundColor: primary_color,
        appBar: AppBar(
          leading: logo,
          backgroundColor: primary_color,
          title: Center(
            child: Text(
              'INVENTORY',
              style: TextStyle(fontFamily: 'Varela Round'),
            ),
          ),
        ),
        body: ItemList(),
        floatingActionButton: FloatingActionButton(
          // backgroundColor: floating_button_color,
          onPressed: addListItems,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
