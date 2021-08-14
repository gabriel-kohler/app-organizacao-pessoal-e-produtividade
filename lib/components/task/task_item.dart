import 'package:flutter/material.dart';
import 'package:prac/models/task.dart';
import 'package:prac/providers/task_provider.dart';
import 'package:provider/provider.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  TaskItem(this.task);

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    return Dismissible(
      key: ValueKey(task.idTask),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 30,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) => showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Remover Task?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(true),
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
      onDismissed: (_) => taskProvider.removeTask(task.idTask),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListTile(
          key: ValueKey(task),
          title: (task.isCompleted)
              ? Text(
                  task.titleTask,
                  style: TextStyle(
                    color: Colors.grey[500],
                    decoration: TextDecoration.lineThrough,
                  ),
                )
              : Text(task.titleTask),
          trailing: (task.isCompleted)
              ? InkWell(
                  onTap: () => taskProvider.completedTask(task),
                  child: Text(
                    'CONCLUÍDO',
                    style: TextStyle(
                      color: Color(0xFF3E9278),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                )
              : InkWell(
                  onTap: () => taskProvider.completedTask(task),
                  child: Text(
                    'CONCLUIR',
                    style: TextStyle(
                      color: Color(0xFF33B78F),
                      fontSize: 12,
                    ),
                  ),
                ),
          leading: SizedBox(
            height: 25,
            width: 10,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color:
                    (task.isCompleted) ? Color(0xFF3E9278) : Color(0xFFC94B4B),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
