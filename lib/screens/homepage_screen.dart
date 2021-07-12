import 'package:flutter/material.dart';
import 'package:prac/components/categories_item.dart';
import 'package:prac/components/clipper.dart';
import 'package:prac/components/task_item.dart';
import 'package:prac/providers/task_provider.dart';
import 'package:provider/provider.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _taskProvider = Provider.of<TaskProvider>(context);
    final _taskCategories = _taskProvider.categories;
    final _categorySelected = _taskProvider.categorySelected;
    final _taskList = _taskProvider.tasksByCategory;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                padding: const EdgeInsets.only(left: 40, top: 50, right: 20),
                height: _size.height * 0.5,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      const Color(0xFFC94B4B),
                      const Color(0xFF4b134f),
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
                        onTap: () =>
                            _taskProvider.openAddTaskFormModal(context),
                      ),
                    ),
                    const SizedBox(height: 20),
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
                const SizedBox(width: 10),
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
            SizedBox(height: _size.height * 0.02),
            Container(
              height: _size.height * 0.45,
              child: _taskList.isEmpty
                  ? Center(
                      child: Text(
                        'Nenhuma task cadastrada.',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    )
                  : ReorderableListView.builder(
                      shrinkWrap: true,
                      onReorder: (oldIndex, newIndex) {
                        // setState(() {
                        //   if (newIndex > oldIndex) {
                        //     newIndex -= 1;
                        //   }

                        //   final task = _taskList.removeAt(oldIndex);
                        //   _taskList.insert(newIndex, task);
                        // });

                        _taskProvider.reorderList(newIndex, oldIndex);
                        print(_taskList.length);
                      },
                      itemCount: _taskList.length,
                      itemBuilder: (ctx, index) {
                        final task = _taskList[index];
                        return Column(
                          key: ValueKey(task),
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
