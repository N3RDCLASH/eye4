import 'package:eye4/style/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        leading: logo,
        backgroundColor: primary_color,
        title: Padding(
          padding: EdgeInsets.fromLTRB(160, 0, 0, 0),
          child: Text(
            'SCHEDULE',
            style: GoogleFonts.varelaRound(),
          ),
        ),
      ),
    );
  }
}
