import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye4/models/item.dart';
import 'package:eye4/models/project.dart';

class DatabaseService {
  //collection refrence
  final CollectionReference inventoryCollection =
      Firestore.instance.collection('Inventory');

  final CollectionReference projectsCollection =
      Firestore.instance.collection('Projects');

  //create document
  Future setInventoryData(
      String productname,
      String modelnumber,
      String supplier,
      DateTime purchasedate,
      double amount,
      String condition,
      String link,
      String image) async {
    return await inventoryCollection.document().setData({
      'productname': productname,
      'modelnumber': modelnumber,
      'supplier': supplier,
      'purchasedate': purchasedate,
      'amount': amount,
      'condition': condition,
      'link': link,
      'image': image
    });
  }

  Future setProjectsData(
    Object client,
    DateTime date,
    String occasion,
    String address,
    Timestamp time,
    Timestamp extendedtime,
    double price,
    double deposit,
    double balance,
    String assignedto,
    bool completed,
  ) async {
    return await projectsCollection.document().setData({
      'client': client,
      'date': date,
      'occasion': occasion,
      'address': address,
      'time': time,
      'extendedtime': extendedtime,
      'price': price,
      'deposit': deposit,
      'balance': balance,
      'assignedto': assignedto,
      'completed': completed
    });
  }

  List<Item> _itemListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map(
      (doc) {
        return Item(
            itemid: doc.documentID,
            productname: doc.data['productname'] ?? '',
            modelnumber: doc.data['modelnumber'] ?? '',
            supplier: doc.data['supplier'] ?? '',
            purchasedate: doc.data['purchasedate'],
            amount: doc.data['amount'],
            condition: doc.data['condition'] ?? '',
            link: doc.data['link'] ?? '',
            image: doc.data['image'] ?? '');
      },
    ).toList();
  }

  List<Project> _projectsListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return Project(
        client: doc.data['client'],

      );
    });
  }

  Stream<List<Item>> get items {
    return inventoryCollection.snapshots().map(_itemListFromSnapshot);
  }

  Stream<List<Project>> get projects {
    return projectsCollection.snapshots().map(_projectsListFromSnapshot);
  }
}
