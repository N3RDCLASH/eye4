import 'package:eye4/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:eye4/services/database.dart';

class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

final _formKey = GlobalKey<FormState>();
String _item;
String _model;

String _datepicked;
DateTime _purchaseDate;

int _quantity;
String _quantityDisplay;

double _price = 0;
String _priceDisplay;

String _condition;
String _supplier;
String _supplierDisplay;
String _link;
var _conditions = ['New', 'Used', 'Broken'];
String _currentSelectedValue;

Future addListItems() async {
  await DatabaseService().setInventoryData(_item, _model, _supplier,
      _purchaseDate, _price, _quantity, _condition, _link, _link);
}

class _AddItemState extends State<AddItem> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _datepicked = null;
    _purchaseDate = null;
    _price = 0;
    _priceDisplay = null;
    _condition = null;
    _supplier = null;
    _supplierDisplay = null;
    _link = null;
    _currentSelectedValue = null;

    print('variables have reset');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary_color,
      appBar: AppBar(
        elevation: 0.0,
        title: Padding(
          padding: EdgeInsets.fromLTRB(100, 0, 0, 0),
        ),
        backgroundColor: secondary_color,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          );
        }),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          color: secondary_color,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
                                child: TextFormField(
                                  style: white_text,
                                  onChanged: (val) {
                                    setState(() => _item = val);
                                  },
                                  decoration: InputDecoration(
                                    enabledBorder: blue_border,
                                    focusedBorder: white_border,
                                    labelStyle: blue_text,
                                    hintText: 'Enter the item name',
                                    hintStyle: secondary_color_text,
                                    labelText: 'Item ',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(60, 20, 60, 35),
                                child: TextFormField(
                                  style: white_text,
                                  onChanged: (val) {
                                    setState(() => _model = val);
                                  },
                                  decoration: InputDecoration(
                                    enabledBorder: blue_border,
                                    focusedBorder: white_border,
                                    labelStyle: blue_text,
                                    hintStyle: secondary_color_text,
                                    hintText: 'Enter the item model number',
                                    labelText: 'Model Number',
                                  ),
                                ),
                              ),
                            ],
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
                                    _datepicked ?? 'Select Date',
                                    style: secondary_color_text,
                                  ),
                                  onTap: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2001),
                                      lastDate: DateTime(2022),
                                    ).then(
                                      (date) {
                                        setState(
                                          () {
                                            _purchaseDate = date;
                                            _datepicked =
                                                DateFormat('MM-dd-yyyy')
                                                    .format(date);
                                            print(_datepicked);
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
                                    'Quantity',
                                    style: blue_text,
                                  ),
                                  subtitle: Text(
                                    _quantityDisplay ?? 'Set the quantity...',
                                    style: secondary_color_text,
                                  ),
                                  onTap: () {
                                    return showDialog(
                                      context: context,
                                      child: SimpleDialog(
                                        backgroundColor: primary_color,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              style: white_text,
                                              decoration: InputDecoration(
                                                enabledBorder: blue_border,
                                                labelStyle: blue_text,
                                                // hintText: 'What do people call you?',
                                                labelText: 'Price',
                                              ),
                                              initialValue: _price.toString(),
                                              onChanged: (val) {
                                                setState(() =>
                                                    _quantity = int.parse(val));
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: 50,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: FlatButton(
                                                color: blue_color,
                                                padding: EdgeInsets.all(8),
                                                child: Text(
                                                  'SAVE',
                                                  style: white_text,
                                                ),
                                                onPressed: () {
                                                  setState(() =>
                                                      _quantityDisplay =
                                                          '$_quantity');
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
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
                                    _priceDisplay ?? 'Set the price...',
                                    style: secondary_color_text,
                                  ),
                                  onTap: () {
                                    return showDialog(
                                      context: context,
                                      child: SimpleDialog(
                                        backgroundColor: primary_color,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              style: white_text,
                                              decoration: InputDecoration(
                                                enabledBorder: blue_border,
                                                labelStyle: blue_text,
                                                // hintText: 'What do people call you?',
                                                labelText: 'Price',
                                              ),
                                              initialValue: _price.toString(),
                                              onChanged: (val) {
                                                setState(() =>
                                                    _price = double.parse(val));
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: 50,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: FlatButton(
                                                color: blue_color,
                                                padding: EdgeInsets.all(8),
                                                child: Text(
                                                  'SAVE',
                                                  style: white_text,
                                                ),
                                                onPressed: () {
                                                  setState(() => _priceDisplay =
                                                      '$_price,-');
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
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
                                    _condition ?? 'Select Condition',
                                    style: secondary_color_text,
                                  ),
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      child: SimpleDialog(
                                        backgroundColor: primary_color,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: FormField<String>(
                                              builder: (FormFieldState<String>
                                                  state) {
                                                return InputDecorator(
                                                  decoration: InputDecoration(
                                                    fillColor: primary_color,
                                                    labelStyle: blue_text,
                                                    enabledBorder: blue_border,
                                                    focusedBorder: white_border,
                                                    errorStyle: TextStyle(
                                                        color: Colors.redAccent,
                                                        fontSize: 16.0),
                                                    hintText:
                                                        'Please select expense',
                                                    border: null,
                                                  ),
                                                  isEmpty:
                                                      _currentSelectedValue ==
                                                              '' ??
                                                          _currentSelectedValue ==
                                                              null,
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                    child:
                                                        DropdownButton<String>(
                                                      icon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down,
                                                        color: blue_color,
                                                      ),
                                                      style: blue_text,
                                                      value:
                                                          _currentSelectedValue,
                                                      isDense: true,
                                                      onChanged:
                                                          (String newValue) {
                                                        setState(() {
                                                          _currentSelectedValue =
                                                              newValue;
                                                          state.didChange(
                                                              newValue);
                                                          _condition = newValue;
                                                        });
                                                      },
                                                      items: _conditions
                                                          .map((String value) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value: value,
                                                          child: Text(
                                                            value,
                                                            style: blue_text,
                                                          ),
                                                        );
                                                      }).toList(),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
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
                                    _supplier ?? 'Set Supplier...',
                                    style: secondary_color_text,
                                  ),
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      child: SimpleDialog(
                                        backgroundColor: primary_color,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              // keyboardType:
                                              //     TextInputType.,
                                              style: white_text,
                                              decoration: InputDecoration(
                                                enabledBorder: blue_border,
                                                labelStyle: blue_text,
                                                // hintText: 'What do people call you?',
                                                labelText: 'Supplier',
                                              ),
                                              initialValue: _supplier,
                                              onChanged: (val) {
                                                setState(() => _supplier = val);
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: 50,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: FlatButton(
                                                color: blue_color,
                                                padding: EdgeInsets.all(8),
                                                child: Text(
                                                  'SAVE',
                                                  style: white_text,
                                                ),
                                                onPressed: () {
                                                  setState(() =>
                                                      _supplierDisplay =
                                                          _supplier);
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
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
                              Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                child: FlatButton(
                                  color: blue_color,
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    'SAVE',
                                    style: white_text,
                                  ),
                                  onPressed: () {
                                    addListItems();
                                    Navigator.pop(context);
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
