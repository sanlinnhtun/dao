// database.dart

// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:flutter_application_1/DB/todo.dart';
import 'package:flutter_application_1/DB/todo_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

// import '/todo_dao.dart';
// import '/todo.dart';

part 'db.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Todo])
abstract class AppDatabase extends FloorDatabase {
  TodoDao get todoDao;
}
