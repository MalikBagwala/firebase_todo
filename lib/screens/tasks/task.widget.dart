import "package:flutter/material.dart";

class Task extends StatefulWidget {
  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: isChecked,
      activeColor: Colors.pink,
      onChanged: (value) {
        setState(() {
          isChecked = value;
        });
      },
      title: Text(
        "Task 1",
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
    );
  }
}
