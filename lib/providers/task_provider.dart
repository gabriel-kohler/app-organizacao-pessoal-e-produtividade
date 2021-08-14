import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prac/components/task/add_task_form.dart';
import 'package:prac/data/dummy_data.dart';
import 'package:prac/models/category.dart';
import 'package:prac/models/task.dart';

class TaskProvider with ChangeNotifier {
  final _itens = DUMMY_TASKS;
  final _categories = DUMMY_CATEGORIES;

  Category _categorySelected;
  //List<Task> _tasksByCategory;

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

  List<Task> get tasksByCategory {
    List<Task> _tasksByCategory = _itens
        .where((task) => task.idCategory == _categorySelected.categoryId)
        .toList();
    return _tasksByCategory;
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

  addCategory(String title) {
    final newCategory = Category(
      categoryId: Random().nextDouble().toString(),
      title: title,
    );

    _categories.add(newCategory);
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

  reorderList(int newIndex, int oldIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }


    final task = _itens.removeAt(oldIndex);
    _itens.insert(newIndex, task);

    // final task = _tasksByCategory.removeAt(oldIndex);
    // _tasksByCategory.insert(newIndex, task);

    notifyListeners();
    }
}
