import 'package:flutter/material.dart';
import 'package:provider_todoappli/model/model.dart';

class Todocontroller extends ChangeNotifier {
  List<Todomodel> todolist = [];
  List<Todomodel> searchlist = [];
  int idcount = 0;

  void addtolist(Todomodel todo) {
    todo.id = idcount++;
    todolist.add(todo);
    notifyListeners();
  }

  void edittodo(Todomodel todo) {
    int index = todolist.indexWhere((element) => element.id == todo.id);
    todolist[index] = todo;
    notifyListeners();
  }

  void deletetodo(int todoid) {
    todolist.removeWhere((element) => element.id == todoid);
    notifyListeners();
  }

  void searchtodo(String query) {
    searchlist.clear();
    if (query.isEmpty) {
      searchlist.addAll(todolist);
    } else {
      searchlist.addAll(todolist.where(
          (todo) => todo.enddate.toLowerCase().contains(query.toLowerCase())));
    }
    notifyListeners();
  }
}
