import 'package:flutter/material.dart';

import 'package:prac/models/note_quill.dart';
import 'package:prac/providers/note_provider.dart';
import 'package:prac/utils/app_routes.dart';
import 'package:provider/provider.dart';


class NoteItem extends StatelessWidget {
  
  final NoteQuill note;

  NoteItem(this.note);

  @override
  Widget build(BuildContext context) {
    final _noteProvider = Provider.of<NoteProvider>(context);
    return Dismissible(
      key: ValueKey(note.id),
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
          title: Text('Remover Nota?'),
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
      onDismissed: (_) => _noteProvider.removeNote(note.id),
      child: Padding(
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
      ),
    );
  }
}
