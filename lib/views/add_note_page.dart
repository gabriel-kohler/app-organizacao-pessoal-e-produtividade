import 'package:flutter/material.dart';
import 'package:prac/models/note.dart';

class AddNotePage extends StatefulWidget {
  @override
  State<AddNotePage> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNotePage> {
  GlobalKey<FormState> _keyForm = GlobalKey();
  final _formData = Map<String, String>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final Note note = ModalRoute.of(context).settings.arguments;

    if (_formData.isEmpty) {
      if (note != null) {
        _formData['title'] = note.titleNote;
        _formData['note'] = note.noteContent;
      } else {
        _formData['title'] = '';
        _formData['note'] = '';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(_formData['title']),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Container(
        height: size.height,
        width: double.infinity,
        margin: EdgeInsets.all(15),
        child: Center(
          child: Card(
            child: Form(
              key: _keyForm,
              child: SizedBox(
                height: size.height * 0.8,
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: '${_formData['title']}',
                      decoration: InputDecoration(
                        labelText: 'Título',
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: '${_formData['note']}',
                        maxLines: null,
                        expands: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
