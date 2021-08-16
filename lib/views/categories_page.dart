import 'package:flutter/material.dart';
import 'package:prac/components/task/category_item.dart';
import 'package:prac/providers/task_provider.dart';
import 'package:provider/provider.dart';

class CategoriesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _taskProvider = Provider.of<TaskProvider>(context);
    final _size = MediaQuery.of(context).size;
    final _taskCategories = _taskProvider.categories;
    return Container(
      width: _size.width * 0.95,
      height: _size.height * 0.045,
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: _taskCategories.length,
          itemBuilder: (ctx, index) {
            final category = _taskCategories[index];
            return CategoryItem(category);
          },
        ),
      ),
    );
  }
}
