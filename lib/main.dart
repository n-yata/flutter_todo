import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_tutorial/todo_app.dart';
import 'package:todo_tutorial/todo_app_state.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoAppState(),
      child: MaterialApp(
        title: 'Todo App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          useMaterial3: true,
        ),
        home: TodoApp(),
      ),
    );
  }
}