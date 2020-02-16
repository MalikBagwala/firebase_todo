import 'package:firebase_todo/screens/login/login-form.widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade600,
      body: Center(
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: "todo-logo",
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 50.0,
                child: Icon(
                  Icons.track_changes,
                  color: Colors.pink.shade900,
                  size: 60.0,
                ),
              ),
            ),
            SizedBox(height:
              30.0,),
            LoginForm(),
          ],
        )),
      ),
    );
  }
}
