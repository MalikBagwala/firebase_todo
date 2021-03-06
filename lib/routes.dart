import 'package:firebase_todo/screens/login.screen.dart';
import 'package:firebase_todo/screens/register.screen.dart';
import 'package:firebase_todo/screens/tasks.screen.dart';
import 'package:flutter/widgets.dart';

class Routes {
  static const String Home = "/";
  static const String Tasks = "/tasks";
  static const String Register = "/register";
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      Routes.Home: (context) => LoginScreen(),
      Routes.Tasks: (context) => TasksScreen(),
      Routes.Register: (context) => RegisterScreen()
    };
  }
}
