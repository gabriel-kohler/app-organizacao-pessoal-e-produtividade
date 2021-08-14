import 'package:flutter/material.dart';

import 'package:prac/models/note_quill.dart';
import 'package:prac/utils/app_routes.dart';


class NoteItem extends StatelessWidget {
  
  final NoteQuill note;

  NoteItem({@required this.note});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Card(
        child: ListTile(
          //isThreeLine: true,
          title: Text(note.titleNote),
          // subtitle: Text(
          //   note.noteContent,
          //   maxLines: 2,
          // ),
          onTap: () => Navigator.of(context).pushNamed(
            AppRoutes.ADD_NOTES_PAGE,
            arguments: note,
          ),
        ),
      ),
    );
  }
}
