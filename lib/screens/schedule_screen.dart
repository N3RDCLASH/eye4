import 'package:eye4/style/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {
  @override
  ScheduleState createState() => ScheduleState();
}

class ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: primary_color,
      appBar: AppBar(
        backgroundColor: primary_color,
        title: Center(
          child: Text('Schedule'),
        ),
      ),
    );
  }
}
