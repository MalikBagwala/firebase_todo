import 'package:firebase_todo/routes.dart';
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
        routes: Routes.getRoutes(),
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
    {"id": uuid.v4(), "name": "Finish Coding", "isChecked": false},
    {"id": uuid.v4(), "name": "Finish Dancing", "isChecked": false},
    {"id": uuid.v4(), "name": "Buy Biscs", "isChecked": false}

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

  void reorderTasks(int oldIndex, int newIndex) {
    Map task = tasks.removeAt(oldIndex);
    if (newIndex > tasks.length) {
      tasks.insert(newIndex - 1, task);
    } else {
      tasks.insert(newIndex, task);
    }
    notifyListeners();
  }
}
