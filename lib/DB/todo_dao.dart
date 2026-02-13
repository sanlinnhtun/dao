// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:flutter_application_1/DB/todo.dart';

@dao
abstract class TodoDao {
  @Query('SELECT * FROM Todo')
  Stream<List<Todo>> getAllTodo();
  // Future<List<Todo>> findAllTodo();

  @Query('DELETE FROM Todo')
  Future<void> deleteAllTodo();

  @insert
  Future<void> insertTodo(Todo todo);

  @delete
  Future<void> deleteTodo(Todo todo);

  @update
  Future<void> updateTodo(Todo todo);

  @Query('DELETE FROM Todo WHERE id = :id')
  Future<void> deteteTodobyId(int id);

  @Query('UPDATE Todo SET name= :name WHERE  id = :id')
  Future<void> updateTodoByID(String name, int id);
}
