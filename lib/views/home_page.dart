import 'package:flutter/material.dart';
import 'package:prac/components/home_item.dart';
import 'package:prac/providers/task_provider.dart';
import 'package:prac/views/categories_page.dart';
import 'package:prac/views/tasks_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _taskProvider = Provider.of<TaskProvider>(context);
    final _categorySelected = _taskProvider.categorySelected;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeItem(),
            Row(
              children: [
                SizedBox(width: _size.width * 0.02),
                CategoriesPage(),
              ],
            ),
            SizedBox(height: _size.height * 0.02),
            TasksPage(),
          ],
        ),
      ),
    );
  }
}
