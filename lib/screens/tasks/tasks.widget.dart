import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_todo/main.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

import "../tasks/task.widget.dart";

class Tasks extends StatefulWidget {
  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  Stream<QuerySnapshot> todosList;
  @override
  void initState() {
    FirebaseAuth.instance.currentUser().then((user) => {
          todosList = Firestore.instance
              .collection("todos")
              .where("userId", isEqualTo: user.uid)
              .snapshots()
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: todosList,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Text("Loading");
            default:
              return ReorderableListView(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                children: [
                  for (var task in snapshot.data.documents)
                    Task(
                      id: task.documentID,
                      key: Key(task.documentID),
                      title: task['title'],
                      isChecked: task['isCompleted'],
                    ),
                ],
                onReorder: (oldIndex, newIndex) {
                  Provider.of<TodoState>(context, listen: false)
                      .reorderTasks(oldIndex, newIndex);
                },
              );
          }
        });
  }
}
