import 'package:flutter/material.dart';
import 'package:prac/models/category.dart';
import 'package:prac/providers/task_provider.dart';
import 'package:provider/provider.dart';

class CategoriesItem extends StatelessWidget {
  final Category category;

  CategoriesItem(this.category);

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => taskProvider.switchCategory(category),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        width: size.width * 0.4,
        height: size.height * 0.04,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF4b134f),
            Color(0xFFC94B4B),
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
