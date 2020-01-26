import 'package:eye4/models/item.dart';
import 'package:eye4/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ItemDetail extends StatefulWidget {
  final Item currentItem;
  @override
  _ItemDetailState createState() => _ItemDetailState();
  ItemDetail(this.currentItem);
}

DateTime _datepicked;

class _ItemDetailState extends State<ItemDetail> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
          backgroundColor: primary_color,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: white_color,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(230, 0, 0, 0),
                        child: IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: white_color,
                          ),
                          onPressed: () {
                            // Navigator.pop(context);
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .3,
                  width: MediaQuery.of(context).size.height * 1,
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://images.unsplash.com/photo-1512790182412-b19e6d62bc39?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: item_list_padding,
                        child: ListTile(
                          leading: Icon(
                            Icons.calendar_today,
                            color: white_color,
                          ),
                          title: Text(
                            'Purchase Date',
                            style: blue_text,
                          ),
                          subtitle: Text(
                            _datepicked.toString(),
                            style: secondary_color_text,
                          ),
                          onTap: () {
                            var purchasedate = widget.currentItem.purchasedate;
                            showDatePicker(
                              context: context,
                              initialDate: purchasedate.toDate(),
                              firstDate: DateTime(2001),
                              lastDate: DateTime(2022),
                            ).then(
                              (date) {
                                setState(
                                  () {
                                    _datepicked = date;
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: item_list_padding,
                        child: ListTile(
                          leading: Icon(
                            Icons.attach_money,
                            color: white_color,
                          ),
                          title: Text(
                            'Price',
                            style: blue_text,
                          ),
                          subtitle: Text(
                            'SRD 300,-',
                            style: secondary_color_text,
                          ),
                          onTap: () {},
                        ),
                      ),
                      Padding(
                        padding: item_list_padding,
                        child: ListTile(
                          leading: Icon(
                            Icons.error_outline,
                            color: white_color,
                          ),
                          title: Text(
                            'Condition',
                            style: blue_text,
                          ),
                          subtitle: Text(
                            'New',
                            style: secondary_color_text,
                          ),
                          onTap: () {},
                        ),
                      ),
                      Padding(
                        padding: item_list_padding,
                        child: ListTile(
                          leading: Icon(
                            Icons.shopping_cart,
                            color: white_color,
                          ),
                          title: Text(
                            'Supplier',
                            style: blue_text,
                          ),
                          subtitle: Text(
                            'Amazon',
                            style: secondary_color_text,
                          ),
                          onTap: () {},
                        ),
                      ),
                      Padding(
                        padding: item_list_padding,
                        child: ListTile(
                          leading: Icon(
                            Icons.link,
                            color: white_color,
                          ),
                          title: Text(
                            'Link',
                            style: blue_text,
                          ),
                          subtitle: Text(
                            'http://amazon.com',
                            style: secondary_color_text,
                          ),
                          onTap: () {},
                        ),
                      ),
                      Padding(
                        padding: item_list_padding,
                        child: ListTile(
                          leading: Icon(
                            Icons.image,
                            color: white_color,
                          ),
                          title: Text(
                            'Image',
                            style: blue_text,
                          ),
                          subtitle: Text(
                            'http://amazon.com',
                            style: secondary_color_text,
                          ),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
