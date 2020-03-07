import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_todo/main.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class AddTaskModal extends StatefulWidget {
  @override
  _AddTaskModalState createState() => _AddTaskModalState();
}

class _AddTaskModalState extends State<AddTaskModal> {
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            children: <Widget>[
              Text(
                "Add Task",
                style: TextStyle(fontSize: 30.0, color: Colors.grey.shade600),
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (text) {
                  setState(() {
                    title = text;
                  });
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                color: Colors.pink.shade700,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 12.0, bottom: 12.0, right: 16.0, left: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "ADD",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                onPressed: () async {
                  var currentUser = await FirebaseAuth.instance.currentUser();
                  Firestore.instance.collection("todos").add({
                    "title": title,
                    "userId": currentUser.uid,
                    "isCompleted": false
                  });

                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
