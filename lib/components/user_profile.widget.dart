import "package:flutter/material.dart";

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.pink.shade600),
            child: Container(),
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text("Todos"),
          )
        ],
      ),
    );
  }
}
