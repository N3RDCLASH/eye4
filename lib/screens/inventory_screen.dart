import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Inventory extends StatefulWidget {
  @override
  InventoryState createState() => InventoryState();
}

class InventoryState extends State<Inventory> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Inventory')),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          
        ],
      )),
    );
  }
}
