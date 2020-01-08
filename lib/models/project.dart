import 'package:cloud_firestore/cloud_firestore.dart';

class Project {
  String projectid;
  Object client;
  DateTime date;
  String occasion;
  String address;
  Timestamp time;
  Timestamp extendedtime;
  double price;
  double deposit;
  double balance;
  String assignedto;
  bool completed;

  Project({
    this.projectid,
    this.client,
    this.date,
    this.occasion,
    this.address,
    this.time,
    this.extendedtime,
    this.price,
    this.deposit,
    this.balance,
    this.assignedto,
    this.completed,
  });
}
