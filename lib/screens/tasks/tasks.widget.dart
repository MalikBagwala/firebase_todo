import "package:flutter/material.dart";
import "../tasks/task.widget.dart";

class Tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      children: <Widget>[
        Task(),
        Task(),
        Task(),
      ],
    );
  }
}
