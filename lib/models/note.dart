import 'package:flutter/foundation.dart';

class Note {  
  final String noteId;
  final String titleNote;
  final String noteContent;

  Note({    
    @required this.noteId,
    @required this.titleNote,
    @required this.noteContent,
  });
}
