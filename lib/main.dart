import 'package:firebase_todo/screens/tasks.screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoState>(
      create: (context) => TodoState(),
      child: MaterialApp(
        routes: {
          "/": (context) => TasksScreen(),
        },
      ),
    );
  }
}

class TodoState extends ChangeNotifier {
  static Uuid uuid = Uuid();
  List<Map> tasks = [
    {"id": uuid.v4(), "name": "Buy Milk", "isChecked": false},
    {"id": uuid.v4(), "name": "Buy Eggs", "isChecked": false},
    {"id": uuid.v4(), "name": "Buy Bread", "isChecked": false},
    {"id": uuid.v4(), "name": "Finish Coding", "isChecked": false}
  ];

  void add(title) {
    tasks.add({"id": uuid.v4(), "name": title, "isChecked": false});
    notifyListeners();
  }

  void toggle(id) {
    print("$id UUID");
    Map task = tasks.singleWhere((task) => task['id'] == id);
    int taskIndex = tasks.indexOf(task);
    tasks[taskIndex]['isChecked'] = !tasks[taskIndex]['isChecked'];
    notifyListeners();
  }
}
