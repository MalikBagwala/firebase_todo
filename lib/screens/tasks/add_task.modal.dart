import "package:flutter/material.dart";

class AddTaskModal extends StatelessWidget {
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
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
