import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prac/components/add_task_form.dart';
import 'package:prac/models/category.dart';
import 'package:prac/models/task.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _itens = [
    Task(
      idTask: '01',
      idCategory: 'c1',
      titleTask: 'Concluir o trabalho da faculdade.',
    ),
    Task(
      idTask: '02',
      idCategory: 'c1',
      titleTask: 'Levar meu cachorro para passear.',
    ),
    Task(
      idTask: '03',
      idCategory: 'c1',
      titleTask: 'Organizar planilhas.',
    ),
    Task(
      idTask: '04',
      idCategory: 'c2',
      titleTask: 'Repassar código para projeto principal.',
    ),
    Task(
      idTask: '05',
      idCategory: 'c2',
      titleTask: 'Revisar e melhorar código.',
    ),
    Task(
      idTask: '06',
      idCategory: 'c2',
      titleTask: 'Versionar projeto.',
    ),
    Task(
      idTask: '07',
      idCategory: 'c3',
      titleTask: 'Estudar sobre versionamento GIT.',
    ),
    Task(
      idTask: '08',
      idCategory: 'c3',
      titleTask: 'Estudar sobre programação orientada a objetos.',
    ),
    Task(
      idTask: '09',
      idCategory: 'c3',
      titleTask: 'Estudar sobre gerenciamento de estado com MOBX.',
    ),
  ];

  final List<Category> _categories = [
    Category(categoryId: 'c1', title: 'Geral'),
    Category(categoryId: 'c2', title: 'Programação'),
    Category(categoryId: 'c3', title: 'Estudos'),
  ];

  Category _categorySelected;

  List<Task> get itens {
    return [..._itens];
  }

  List<Category> get categories {
    return [..._categories];
  }

  Category get categorySelected {
    if (_categorySelected == null) {
      _categorySelected = _categories[0];
    }
    return _categorySelected;
  }

  getTasksByCategory(String categoryId) {
    List<Task> tasksByCategory =
        _itens.where((task) => task.idCategory == categoryId).toList();
    return tasksByCategory;
  }

  switchCategory(Category newCategory) {
    _categorySelected = newCategory;
    notifyListeners();
  }

  addTask(String title, String categoryId) {
    final newTask = Task(
      idTask: Random().nextDouble().toString(),
      idCategory: categoryId,
      titleTask: title,
    );
    _itens.add(newTask);
    notifyListeners();
  }

  removeTask(String id) {
    _itens.removeWhere((task) => task.idTask == id);
    notifyListeners();
  }

  completedTask(Task task) {
    task.isCompleted = !task.isCompleted;
    notifyListeners();
  }

  openAddTaskFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return AddTaskForm(addTaskFunction: addTask);
        });
  }
}
