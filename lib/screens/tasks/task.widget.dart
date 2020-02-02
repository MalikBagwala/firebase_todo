import "package:flutter/material.dart";

class Task extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: true,
      title: Text("Task 1"),
    );
  }
}
