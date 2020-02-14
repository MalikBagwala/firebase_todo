import 'package:firebase_todo/routes.dart';
import "package:flutter/material.dart";

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _loginFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginFormKey,
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: TextFormField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                fillColor: Colors.white,
                focusColor: Colors.pink,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              style: TextStyle(fontSize: 20.0, color: Colors.white),
              onChanged: (value) {},
            ),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.Tasks);
            },
            child: Text("Submit"),
          )
        ],
      ),
    );
  }
}
