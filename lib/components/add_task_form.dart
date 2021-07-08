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
  final _titleTaskController = TextEditingController();
  final _titleCategoryController = TextEditingController();
  GlobalKey<FormState> _form = GlobalKey();
  Category _selectedCategory;
  List<Category> _categories;
  bool _addNewCategorySelected = false;

  _submitTaskForm(String categoryId) {
    if (!_form.currentState.validate()) {
      return;
    }
    _form.currentState.save();

    final title = _titleTaskController.text;

    widget.addTaskFunction(title, categoryId);
    Navigator.of(context).pop();
  }

  _submitCategoryForm() {
    if (!_form.currentState.validate()) {
      return;
    }
    _form.currentState.save();

    final title = _titleCategoryController.text;

    Provider.of<TaskProvider>(context, listen: false).addCategory(title);
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

  _addNewCategory() {
    setState(() {
      _addNewCategorySelected = !_addNewCategorySelected;
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
                vertical: 10,
              ),
              child: Image.asset('assets/img/img3.png'),
            ),
            Form(
              key: _form,
              child: TextFormField(
                autocorrect: true,
                controller: (_addNewCategorySelected)
                    ? _titleCategoryController
                    : _titleTaskController,
                decoration: InputDecoration(
                    labelText:
                        (_addNewCategorySelected) ? 'Nova Categoria' : 'Task'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Escreva um título válido';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                (_addNewCategorySelected)
                    ? IconButton(
                        onPressed: () => _addNewCategory(),
                        icon: Icon(Icons.arrow_back),
                      )
                    : InkWell(
                        child: Image.asset(
                          'assets/img/img11.png',
                          width: 18,
                          height: 18,
                        ),
                        onTap: () => _addNewCategory(),
                      ),
                DropdownButton(
                  hint: Text('Categoria'),
                  items: (_addNewCategorySelected)
                      ? null
                      : _categories.map((category) {
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
                      onPressed: () {
                        //if the user does not select a category for the new task, the new task will be added
                        //the first category in the category list, in this case being the "geral" category.
                        if (_selectedCategory == null) {
                          _selectedCategory = _categories[0];
                        }
                        (_addNewCategorySelected)
                            ? _submitCategoryForm()
                            : _submitTaskForm(_selectedCategory.categoryId);
                      },
                      child: Text(
                        (_addNewCategorySelected)
                            ? 'Nova Categoria'
                            : 'Nova Task',
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
