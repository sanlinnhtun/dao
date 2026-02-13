import 'package:flutter/material.dart';
import 'package:flutter_application_1/DB/todo.dart';
import 'package:flutter_application_1/DB/todo_dao.dart';

class AddPage extends StatelessWidget {
  final TodoDao todoDao;
  AddPage(this.todoDao, {super.key});
  final textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Page")),
      body: Column(
        children: [
          Expanded(
            child: TextField(
              controller: textFieldController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
                hint: Text('Enter your name'),
              ),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
            onPressed: () {
              todoDao.insertTodo(Todo.forAdd(textFieldController.text));
            },
            child: Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
