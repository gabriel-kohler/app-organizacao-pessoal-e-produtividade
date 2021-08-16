import 'package:flutter/material.dart';
import 'package:prac/components/task/task_item.dart';
import 'package:prac/providers/task_provider.dart';
import 'package:provider/provider.dart';

class TasksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _taskProvider = Provider.of<TaskProvider>(context);
    final _taskList = _taskProvider.tasksByCategory;
    final _size = MediaQuery.of(context).size;
    return Container(
      height: _size.height * 0.46,
      child: _taskList.isEmpty
          ? Center(
              child: Text(
                'Nenhuma task cadastrada.',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            )
          : MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _taskList.length,
                itemBuilder: (ctx, index) {
                  final task = _taskList[index];
                  return Column(
                    children: [
                      TaskItem(task),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: _size.width * 0.08),
                        child: Divider(),
                      ),
                    ],
                  );
                },
              ),
            ),
    );
  }
}
