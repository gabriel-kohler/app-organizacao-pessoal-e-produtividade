import 'package:flutter/material.dart';
import 'package:prac/models/category.dart';
import 'package:prac/providers/task_provider.dart';
import 'package:provider/provider.dart';

class AddTaskForm extends StatefulWidget {
  final Function(String, String) addTaskFunction;

  AddTaskForm({
    @required this.addTaskFunction,
  });

  @override
  _AddTaskFormState createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  final _titleController = TextEditingController();
  List<DropdownMenuItem<Category>> _dropdownMenuItems;
  Category _selectedCategory;
  List<Category> _categories;

  _submitForm(String categoryId) {
    final title = _titleController.text;
    widget.addTaskFunction(title, categoryId);
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    _categories = Provider.of<TaskProvider>(context, listen: false).categories;

    super.initState();
  }

  _onChangeDropdownItem(Category selectedCategory) {
    setState(() {
      _selectedCategory = selectedCategory;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Image.asset('assets/img/img3.png'),
            ),
            TextField(
              autocorrect: true,
              controller: _titleController,
              onSubmitted: (_) {},
              decoration: const InputDecoration(labelText: 'Task'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropdownButton(
                  hint: Text('Categoria'),
                  items: _categories.map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category.title),
                    );
                  }).toList(),
                  value: _selectedCategory,
                  onChanged: _onChangeDropdownItem,
                ),
                SizedBox(
                  width: 150,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    child: ElevatedButton(
                      onPressed: () =>
                          _submitForm(_selectedCategory.categoryId),
                      child: Text(
                        'Nova Task',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFC94B4B),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
          ]),
        ),
      ),
    );
  }
}