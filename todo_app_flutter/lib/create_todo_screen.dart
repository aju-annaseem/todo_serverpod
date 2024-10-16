import 'package:flutter/material.dart';
import 'package:todo_app_client/todo_app_client.dart';
import 'package:todo_app_flutter/main.dart';

class CreateTodo extends StatelessWidget {
  const CreateTodo({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleCt = TextEditingController();
    TextEditingController descCt = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: titleCt,
            ),
            TextField(
              controller: descCt,
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () async {
                  Todo todo = Todo(
                      title: titleCt.text,
                      description: descCt.text,
                      isCompleted: false);
                  final result = await client.todo.createTodo(todo);
                  print(result);
                },
                child: Text('Save'))
          ],
        ),
      ),
    );
  }
}
