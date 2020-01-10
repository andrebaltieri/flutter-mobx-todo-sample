import 'package:mobx/mobx.dart';
import 'package:todo/models/todo.modal.dart';
part 'todo.store.g.dart';

class TodoStore = _TodoStore with _$TodoStore;

abstract class _TodoStore with Store {
  @observable
  ObservableList<Todo> todos = ObservableList<Todo>();

  @action
  void Add(Todo todo) {
    todos.add(todo);
  }
}
