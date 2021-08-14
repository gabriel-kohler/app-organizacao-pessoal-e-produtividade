import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:prac/data/dummy_data.dart';
import 'package:prac/models/note_quill.dart';

class NoteProvider with ChangeNotifier {


  final _allNotes = DUMMY_NOTES;

  List<dynamic> get notes {
    return _allNotes;
  }

  addNote(String title, List<dynamic> note) {
    final newNote = NoteQuill(
      id: Random().nextDouble().toString(),
      titleNote: title,
      note: note,
    );
    notes.add(newNote);
    notifyListeners();
  }

  removeNote(String id) {
    _allNotes.removeWhere((note) => note.id == id);
    notifyListeners();
  }
}
