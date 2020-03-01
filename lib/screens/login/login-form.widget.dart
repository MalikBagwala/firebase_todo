import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_todo/components/input.widget.dart';
import 'package:firebase_todo/components/rounded_button.widget.dart';
import 'package:firebase_todo/routes.dart';
import "package:flutter/material.dart";

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Input(
            keyboardType: TextInputType.emailAddress,
            decoration:
                kTextFieldDecoration.copyWith(hintText: "Enter your email"),
            onChange: (value) {
              email = value;
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          Input(
            obscureText: true,
            keyboardType: TextInputType.text,
            decoration:
                kTextFieldDecoration.copyWith(hintText: "Enter your password"),
            onChange: (value) {
              password = value;
            },
          ),
          RoundedButton(
            title: "Submit",
            onPressed: () async {
              try {
                final newUser = await _auth.createUserWithEmailAndPassword(
                    email: email, password: password);
                if (newUser != null) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 5),
                      content: ListTile(
                        leading: Icon(
                          Icons.check,
                          color: Colors.greenAccent,
                        ),
                        title: Text("${newUser.user.email} Registered"),
                      ),
                    ),
                  );
                  Navigator.pushNamed(context, Routes.Tasks);
                }
              } catch (e) {
                print(e);
              }
            },
          ),
        ],
      ),
    );
  }
}
