import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Project extends StatefulWidget {
  @override
  ProjectState createState() => ProjectState();
}

class ProjectState extends State<Project> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Projects'),
        ),
      ),
    );
  }
}
