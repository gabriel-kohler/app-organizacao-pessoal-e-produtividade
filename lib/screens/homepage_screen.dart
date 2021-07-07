import 'package:flutter/material.dart';
import 'package:prac/components/categories_item.dart';
import 'package:prac/components/clipper.dart';
import 'package:prac/components/task_item.dart';
import 'package:prac/models/task.dart';
import 'package:prac/providers/task_provider.dart';
import 'package:provider/provider.dart';

class HomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Task> _taskList;
    final _size = MediaQuery.of(context).size;
    final _taskProvider = Provider.of<TaskProvider>(context);
    final _taskCategories = _taskProvider.categories;
    final _categorySelected = _taskProvider.categorySelected;
    _taskList = _taskProvider.getTasksByCategory(_categorySelected.categoryId);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                padding: EdgeInsets.only(left: 40, top: 50, right: 20),
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFFC94B4B),
                      Color(0xFF4b134f),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        child: Image.asset(
                          'assets/img/img10.png',
                          width: 18,
                          height: 18,
                        ),
                        onTap: () => _taskProvider.openAddTaskFormModal(context),
                      ),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/img/img8.png',
                            width: 230,
                            alignment: Alignment.topLeft,
                            fit: BoxFit.fitWidth,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(width: 10),
                Container(
                  width: _size.width * 0.95,
                  height: _size.height * 0.045,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: _taskCategories.length,
                    itemBuilder: (ctx, index) {
                      final category = _taskCategories[index];
                      return CategoriesItem(category);
                    },
                  ),
                ),
              ],
            ),
            Container(
              height: _size.height * 0.4,
              child: _taskList.isEmpty
                  ? Center(
                      child: Text(
                        'Nenhuma task cadastrada.',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: _taskList.length,
                      itemBuilder: (ctx, index) {
                        final task = _taskList[index];
                        return Column(
                          children: [
                            TaskItem(task),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Divider(),
                            ),
                          ],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}