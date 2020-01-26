import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  final String itemid;
  final String productname;
  final String modelnumber;
  final String supplier;
  final Timestamp purchasedate;
  final double amount;
  final int quantity;
  final String condition;
  final String link;
  final String image;

  Item({
    this.itemid,
    this.productname,
    this.modelnumber,
    this.supplier,
    this.purchasedate,
    this.amount,
    this.quantity,
    this.condition,
    this.link,
    this.image,
  });
}
