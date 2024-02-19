
import 'package:flutter/material.dart';

class TaskView extends StatelessWidget {
  static const String route_name="TaskView";
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("TaskView")),
    );
  }
}
