import 'package:eye4/screens/item_detail_screen.dart';
import 'package:eye4/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:eye4/models/item.dart';
import 'package:provider/provider.dart';

class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    final items = Provider.of<List<Item>>(context);
    //  print(items.documents);
    items?.forEach((item) {
      print(item.itemid);
    });

    var length = items?.length ?? 0;

    return ListView.builder(
      itemCount: length,
      itemBuilder: (context, index) {
        return Container(
          height: 100,
          child: Card(
            color: inventory_card_color,
            margin: EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                0,
                5,
                0,
                0,
              ),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ItemDetail(items[index]),
                    ),
                  );
                },
                leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/Rectangle.png')),
                title: Text(
                  items[index].productname,
                  style: inventory_card_text,
                ),
                subtitle: Text(
                  items[index].modelnumber,
                  style: TextStyle(color: blue_color),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: white_color,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
