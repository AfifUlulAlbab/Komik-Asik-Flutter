import 'package:flutter/material.dart';
import 'todo_model.dart';

class StateProvider with ChangeNotifier {
  List<Todo> items = List<Todo>.empty(growable: true);

  // Operations
  void editTask(Todo item, String description) {
    if (description != null && description != '') {
      item.description = description;
      notifyListeners();
    }
  }

  void removeItem(Todo item) {
    items.remove(item);
    notifyListeners();
  }

  void addNewTask(String description) {
    if (description != null && description != '') {
      items.add(Todo(description));
      notifyListeners();
    }
  }
}
