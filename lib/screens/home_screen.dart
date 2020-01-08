import 'package:eye4/screens/inventory_screen.dart';
import 'package:eye4/screens/projects_screen.dart';
import 'package:eye4/screens/schedule_screen.dart';
import 'package:eye4/style/theme.dart';
import "package:flutter/material.dart";

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Inventory(),
    Schedule(),
    Projects(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('BottomNavigationBar Sample'),
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: primary_color,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.system_update_alt,
              color: white_color,
            ),
            title: Text(
              'Inventory',
              style: white_text,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today,
              color: white_color,
            ),
            title: Text(
              'Schedule',
              style: white_text,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
              color: white_color,
            ),
            title: Text(
              'Projects',
              style: white_text,
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
