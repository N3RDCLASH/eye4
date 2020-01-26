import 'package:eye4/services/database.dart';
import 'package:eye4/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eye4/models/project.dart';
import 'package:eye4/widgets/project_list.dart';
import 'package:google_fonts/google_fonts.dart';

class Projects extends StatefulWidget {
  @override
  ProjectsState createState() => ProjectsState();
}

class ProjectsState extends State<Projects> {
  Future addListItems() async {
    // await DatabaseService().setProjectsData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamProvider<List<Project>>.value(
      value: DatabaseService().projects,
      child: Scaffold(
        backgroundColor: primary_color,
        appBar: AppBar(
          leading: logo,
          backgroundColor: primary_color,
          title: Padding(
            padding: EdgeInsets.fromLTRB(160, 0, 0, 0),
            child: Text(
              'PROJECTS',
              style: GoogleFonts.varelaRound(),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          // backgroundColor: floating_button_color,
          onPressed: () {},
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
