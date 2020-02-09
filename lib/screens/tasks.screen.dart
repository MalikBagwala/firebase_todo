import 'package:firebase_todo/main.dart';
import 'package:firebase_todo/screens/tasks/add_task.modal.dart';
import 'package:firebase_todo/screens/tasks/tasks.widget.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    int totalTasks = Provider.of<TodoState>(context).tasks.length;
    return Container(
      child: Scaffold(
        backgroundColor: Colors.pink.shade600,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTaskModal(),
                ),
              ),
            );
          },
          backgroundColor: Colors.pink.shade600,
          child: Icon(Icons.add),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  top: 40.0,
                  left: 30.0,
                  bottom: 30.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Hero(
                      tag: "todo-logo",
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30.0,
                        child: Icon(
                          Icons.track_changes,
                          color: Colors.pink.shade900,
                          size: 28.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Todo List",
                      style: TextStyle(
                          fontSize: 50.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "$totalTasks ",
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                            TextSpan(text: "Todos")
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0),
                    ),
                  ),
                  child: Tasks(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
