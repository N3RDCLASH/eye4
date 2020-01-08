import 'package:eye4/services/database.dart';
import 'package:eye4/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eye4/models/project.dart';
import 'package:eye4/widgets/project_list.dart';

class Projects extends StatefulWidget {
  @override
  ProjectsState createState() => ProjectsState();
}

class ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamProvider<List<Project>>.value(
      value: DatabaseService().projects,
      child: Scaffold(
        backgroundColor: primary_color,
        appBar: AppBar(
          backgroundColor: primary_color,
          title: Center(
            child: Text('Projects'),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          // backgroundColor: floating_button_color,
          onPressed:(){},
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
