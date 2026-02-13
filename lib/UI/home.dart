import 'package:flutter/material.dart';
import 'package:flutter_application_1/DB/todo.dart';
import 'package:flutter_application_1/DB/todo_dao.dart';
import 'package:flutter_application_1/UI/addpage.dart';

class Home extends StatelessWidget {
  final TodoDao todoDao;
  // final String title;
  // final String description;
  // final DateTime date;

  Home(this.todoDao);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddPage(todoDao)),
              );
            },
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              todoDao.insertTodo(Todo.forAdd("default name"));
            },
            child: Icon(Icons.add),
          ),
          SizedBox(width: 12),
          FloatingActionButton(
            onPressed: () {
              todoDao.deleteAllTodo();
            },
            child: Icon(Icons.delete),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: todoDao.getAllTodo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final todos = snapshot.data!;

            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];

                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    title: Text(todo.name),
                    subtitle: Text("ID: ${todo.id}"),

                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                TextEditingController controller =
                                    TextEditingController(text: todo.name);

                                return AlertDialog(
                                  title: Text("Edit Todo"),
                                  content: TextField(
                                    controller: controller,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: "Enter new text",
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text("Cancel"),
                                    ),
                                    ElevatedButton(
                                      onPressed: () async {
                                        // final updatedTodo = Todo(
                                        //   todo.id!,
                                        //   controller.text,
                                        // );
                                        await todoDao.updateTodoByID(
                                          controller.text,
                                          todo.id!,
                                        );
                                        Navigator.pop(context);
                                      },
                                      child: Text("Update"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () async {
                            // await todoDao.deleteTodo(todo);
                            await todoDao.deteteTodobyId(todo.id!);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Error loading data ❌"));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
