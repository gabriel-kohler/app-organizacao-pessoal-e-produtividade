import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_quill/models/documents/document.dart';
import 'package:prac/models/note_quill.dart';
import 'package:prac/providers/note_provider.dart';
import 'package:provider/provider.dart';

class AddNotePage extends StatefulWidget {
  @override
  State<AddNotePage> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNotePage> {
  GlobalKey<FormState> _keyForm = GlobalKey();
  final _formData = Map<String, String>();
  final _titleFocusNode = FocusNode();
  final _noteFocusNode = FocusNode();

  quill.QuillController _controller = quill.QuillController.basic();

  bool _isLoadNote = false;
  dynamic note;

  @override
  void dispose() {
    super.dispose();
    _titleFocusNode.dispose();
    _noteFocusNode.dispose();
  }

  @override
  void initState() {
    super.initState();
    _isLoadNote = true;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final NoteQuill noteQuill = ModalRoute.of(context).settings.arguments;

    if (_formData.isEmpty) {
      if (noteQuill != null) {
        _formData['title'] = noteQuill.titleNote;
      } else {
        _formData['title'] = 'Nova anotação';
      }
    }
    _loadNote(noteQuill);
  }

  Future<void> _loadNote(NoteQuill noteQuill) async {
    try {
      final templateNote =
          await rootBundle.loadString('assets/img/sample_data.json');
      //da pra usar essa forma para criar modelos(templates) de notas como no evernote

      final doc = (noteQuill != null)
          ? Document.fromJson(noteQuill.note)
          : Document.fromJson(jsonDecode(templateNote));

      setState(() {
        noteQuill != null ? note = noteQuill.note : note = templateNote;
      });

      //conditional is necessary for load notes correctly without bug
      //this conditional guarantees that the controller will only be changed in the first build
      if (_isLoadNote)
        setState(() {
          _controller = quill.QuillController(
            document: doc,
            selection: TextSelection.collapsed(
              offset: 0, //doc.toPlainText().trim().length
            ),
          );
          _isLoadNote = false;
        });
    } catch (error) {
      final doc = Document()..insert(0, 'Empty asset');
      setState(() {
        _controller = quill.QuillController(
          document: doc,
          selection: const TextSelection.collapsed(offset: 0),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final NoteQuill noteQuill = ModalRoute.of(context).settings.arguments;
    final _size = MediaQuery.of(context).size;
    final _noteProvider = Provider.of<NoteProvider>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                noteQuill != null
                    ? noteQuill.note = _controller.document.toDelta().toJson()
                    : note = _controller.document.toDelta().toJson();
              });
              _noteProvider.addNote(
                _formData['title'],
                note,
              );
            },
            icon: Icon(Icons.check),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: _size.height,
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 18,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.grey[50],
                  ),
                  child: Row(
                    children: [
                      ClipPath(
                        child: quill.QuillToolbar.basic(
                          controller: _controller,
                          showLink: true,
                          toolbarIconSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Card(
                  child: Form(
                    key: _keyForm,
                    child: SizedBox(
                      height: _size.height * 0.778,
                      width: _size.width * 1,
                      child: Column(
                        children: [
                          TextFormField(
                            initialValue: '${_formData['title']}',
                            decoration: InputDecoration(
                              labelText: 'Título',
                              contentPadding: EdgeInsets.all(10),
                            ),
                            focusNode: _titleFocusNode,
                          ),
                          // RawKeyboardListener(
                          //   focusNode: FocusNode(),
                          //   onKey: (event) {
                          //     noteQuill.note =
                          //         _controller.document.toDelta().toJson();
                          //     if (event.data.isControlPressed &&
                          //         event.character == 'b') {
                          //       if (_controller
                          //           .getSelectionStyle()
                          //           .attributes
                          //           .keys
                          //           .contains('bold')) {
                          //         _controller.formatSelection(
                          //             quill.Attribute.clone(
                          //                 quill.Attribute.bold, null));
                          //       } else {
                          //         _controller
                          //             .formatSelection(quill.Attribute.bold);
                          //       }
                          //     }
                          // },
                          //child:
                          Container(
                            height: _size.height * 0.7,
                            child: quill.QuillEditor(
                              controller: _controller,
                              scrollController: ScrollController(),
                              scrollable: true,
                              focusNode: _noteFocusNode,
                              autoFocus: false,
                              readOnly: false,
                              expands: false,
                              padding: EdgeInsets.all(10),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
