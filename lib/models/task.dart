import 'package:flutter/foundation.dart';

class Task {

  final String idTask;
  final String idCategory;
  final String titleTask; 
  
  bool isCompleted;

  Task({
  @required this.idTask,
  @required this.idCategory,
  @required this.titleTask,
  this.isCompleted = false,
  });
}