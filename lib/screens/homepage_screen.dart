import 'package:flutter/material.dart';
import 'package:prac/components/categories_item.dart';
import 'package:prac/components/clipper.dart';
import 'package:prac/components/task_item.dart';
import 'package:prac/models/category.dart';
import 'package:prac/models/task.dart';
import 'package:prac/providers/task_provider.dart';
import 'package:provider/provider.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  List<Task> _taskList;

  @override
  void initState() {
    super.initState();
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    final categorySelected = taskProvider.categorySelected;
    _taskList = taskProvider.getTasksByCategory(categorySelected.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final taskProvider = Provider.of<TaskProvider>(context);
    final _taskCategories = taskProvider.categories;

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
                        onTap: () => taskProvider.openAddTaskFormModal(context),
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
                  width: size.width * 0.95,
                  height: size.height * 0.045,
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
              height: size.height * 0.4,
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
