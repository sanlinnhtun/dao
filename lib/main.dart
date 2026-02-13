import 'package:flutter/material.dart';
import 'package:flutter_application_1/DB/db.dart';
import 'package:flutter_application_1/DB/todo.dart';
import 'package:flutter_application_1/DB/todo_dao.dart';
import 'package:flutter_application_1/UI/addpage.dart';
import 'package:flutter_application_1/UI/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: $FloorAppDatabase.databaseBuilder("todo.db").build(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Home(snapshot.data!.todoDao);
          } else if (snapshot.hasError) {
            return Text("Heyyy.., you have error");
          } else {
            return Text(" Loading...");
          }
        },
      ),
    );
  }
}
