import "package:flutter/material.dart";

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.pinkAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.pinkAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

class Input extends StatelessWidget {
  final Function onChange;
  final InputDecoration decoration;
  final TextInputType keyboardType;
  final bool obscureText;
  Input({this.onChange,this.decoration=kTextFieldDecoration,this.keyboardType,this.obscureText=false});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(32.0))
      ),
      child: TextField(
        obscureText: obscureText,
        keyboardType: keyboardType,
        textAlign: TextAlign.center,
        onChanged: onChange,
        decoration: decoration,
      ),
    );
  }
}
