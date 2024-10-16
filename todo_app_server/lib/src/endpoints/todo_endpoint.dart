import 'package:serverpod/serverpod.dart';
import 'package:todo_app_server/src/generated/todo.dart';

class TodoEndpoint extends Endpoint {
  Future<int> createTodo(Session session, Todo todo) async {
    Todo newTodo = await Todo.db.insertRow(session, todo);
    return newTodo.id!;
  }

  Future<List<Todo>> getTodoList(Session session, {String? keyword}) async {
    List<Todo> todoList = await Todo.db.find(
      session,
      orderBy: (t) => t.id,
    );
    print(todoList.length);
    return todoList;
  }
}
