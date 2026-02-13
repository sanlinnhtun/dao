// entity/person.dart

import 'package:floor/floor.dart';

@entity
class Todo {
  @PrimaryKey(autoGenerate: true)
  int? id;

  final String name;

  Todo(this.id, this.name);
  Todo.forAdd(this.name);
}
