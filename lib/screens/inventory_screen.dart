import 'package:eye4/screens/add_item_screen.dart';
import 'package:eye4/style/theme.dart';
import 'package:eye4/models/item.dart';
import 'package:eye4/services/database.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:eye4/widgets/item_list.dart';
import 'package:google_fonts/google_fonts.dart';

class Inventory extends StatefulWidget {
  @override
  InventoryState createState() => InventoryState();
}

class InventoryState extends State<Inventory> {
  //TEST FUnction with dummy data
  

  // List<Widget> _inventory = [];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamProvider<List<Item>>.value(
      value: DatabaseService().items,
      child: Scaffold(
        backgroundColor: primary_color,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(8,0,0,0),
            child: logo,
          ),
          backgroundColor: primary_color,
          title: Padding(
            padding: EdgeInsets.fromLTRB(150, 0, 0, 0),
            child: Text(
              'INVENTORY',
              style: GoogleFonts.varelaRound(),
            ),
          ),
        ),
        body: ItemList(),
        floatingActionButton: FloatingActionButton(
          // backgroundColor: floating_button_color,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddItem(),
              ),
            );
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
