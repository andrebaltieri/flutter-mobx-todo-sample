import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo/models/todo.modal.dart';
import './stores/counter.store.dart';
import './stores/todo.store.dart';

final counter = Counter();
final todoStore = TodoStore();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (_) => Text(todoStore.todos.length.toString()),
        ),
      ),
      body: Container(
        child: Observer(
          builder: (_) => ListView.builder(
            itemCount: todoStore.todos.length,
            itemBuilder: (context, index) {
              var todo = todoStore.todos[index];
              return Text(todo.title);
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var todo = new Todo(id: 1, title: "Testando", done: false);
          todoStore.Add(todo);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
