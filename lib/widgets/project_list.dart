import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eye4/models/project.dart';

class ProjectsList extends StatefulWidget {
  @override
  _ProjectsListState createState() => _ProjectsListState();
}

class _ProjectsListState extends State<ProjectsList> {
  @override
  Widget build(BuildContext context) {
    final projects = Provider.of<List<Project>>(context);

    return Container();
  }
}
