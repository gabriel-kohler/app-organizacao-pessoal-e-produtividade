import 'package:flutter/material.dart';
import 'package:prac/components/note_item.dart';
import 'package:prac/data/dummy_data.dart';
import 'package:prac/models/note_quill.dart';
import 'package:prac/utils/app_routes.dart';


class NotesPage extends StatelessWidget {
  
  final notesList = DUMMY_NOTES;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(AppRoutes.ADD_NOTES_PAGE),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: notesList.length,
        itemBuilder: (ctx, index) {
          final NoteQuill notes = notesList[index];
          return NoteItem(note: notes);
        },
      ),
    );
  }
}
