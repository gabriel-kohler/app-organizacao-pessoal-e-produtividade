import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      resizeToAvoidBottomInset: false,
      body: Container(
        height: _size.height,
        width: _size.width,
        child: Column(
          children: [
            Expanded(
              child: LayoutBuilder(builder: (_, constraints) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: constraints.maxHeight * 0.56,
                      child: HomeItem(),
                    ),
                    Row(
                      children: [
                        SizedBox(width: constraints.maxWidth * 0.02),
                        Container(
                          height: constraints.maxHeight * 0.05,
                          child: CategoriesPage(),
                        ),
                      ],
                    ),
                    Container(
                      height: constraints.maxHeight * 0.37,
                      child: TasksPage(),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
