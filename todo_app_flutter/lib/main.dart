import 'package:todo_app_client/todo_app_client.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:todo_app_flutter/create_todo_screen.dart';

var client = Client('http://$localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Serverpod Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'TODO List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  bool isLoading = true;
  List<Todo> todoList = [];
  void getTodoList() async {
    try {
      todoList = await client.todo.getTodoList();
      print(todoList.length);
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e.toString());
      setState(() {
        isLoading = false;
      });
      rethrow;
    }
  }

  @override
  void initState() {
    getTodoList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: isLoading
              ? Center(
                  child: Text('No data'),
                )
              : ListView.builder(
                  itemCount: todoList.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(todoList[index].title),
                    subtitle: Text(todoList[index].description),
                  ),
                )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateTodo()),
          );
        },
      ),
    );
  }
}
