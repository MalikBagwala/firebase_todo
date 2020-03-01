import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_todo/components/input.widget.dart';
import 'package:firebase_todo/components/rounded_button.widget.dart';
import 'package:firebase_todo/routes.dart';
import "package:flutter/material.dart";

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;
  var register = {};

  void _handleChange(path, value) {
    setState(() {
      register[path] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(register);
    return Scaffold(
      backgroundColor: Colors.pink.shade600,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Input(
                  onChange: (value) => _handleChange("firstName", value),
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: "First Name"),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Input(
                  onChange: (value) => _handleChange("lastName", value),
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: "Last Name"),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Input(
                  onChange: (value) => _handleChange("email", value),
                  decoration: kTextFieldDecoration.copyWith(hintText: "E-Mail"),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Input(
                  obscureText: true,
                  onChange: (value) => _handleChange("password", value),
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: "Password"),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Input(
                  obscureText: true,
                  onChange: (value) => _handleChange("confirmPassword", value),
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: "Confirm Password"),
                ),
                SizedBox(
                  height: 15.0,
                ),
                RoundedButton(
                  onPressed: () async {
                    await _auth
                        .createUserWithEmailAndPassword(
                            email: register['email'],
                            password: register['password'])
                        .then((user) {
                      if (user != null) {
                        Navigator.pushNamed(context, Routes.Home);
                      }
                    });
                  },
                  title: "Register",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
