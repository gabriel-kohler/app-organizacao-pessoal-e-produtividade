import 'package:flutter/material.dart';
import 'package:prac/models/category.dart';
import 'package:prac/providers/task_provider.dart';
import 'package:provider/provider.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => taskProvider.switchCategory(category),
      onLongPress: () => showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Remover Categoria?'),
          actions: [
            TextButton(
              onPressed: () {
                taskProvider.removeCategory(category.categoryId);
                Navigator.of(ctx).pop(true);
              },
              child: Text(
                'Sim',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: Text(
                'Não',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        width: size.width * 0.4,
        height: size.height * 0.04,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            const Color(0xFF4b134f),
            const Color(0xFFC94B4B),
          ]),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            category.title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
