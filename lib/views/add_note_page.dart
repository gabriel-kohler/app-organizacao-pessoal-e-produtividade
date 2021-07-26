import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_quill/models/documents/document.dart';
import 'package:prac/models/note_quill.dart';

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

  @override
  void dispose() {
    super.dispose();
    _titleFocusNode.dispose();
    _noteFocusNode.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final NoteQuill noteQuill = ModalRoute.of(context).settings.arguments;

    if (_formData.isEmpty) {
      if (noteQuill != null) {
        _formData['title'] = noteQuill.titleNote;
      } else {
        _formData['title'] = '';
      }
    }
    _loadFromAssets(noteQuill);
  }

  Future<void> _loadFromAssets(NoteQuill noteQuill) async {
    try {
      final note = await rootBundle.loadString('assets/img/sample_data.json');
      //da pra usar essa forma para criar modelos(templates) de notas como no evernote

      final doc = (noteQuill != null)
          ? Document.fromJson(noteQuill.note)
          : Document.fromJson(jsonDecode(note));

      setState(() {
        _controller = quill.QuillController(
          document: doc,
          selection: const TextSelection.collapsed(offset: 0),
        );
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                noteQuill.note = _controller.document.toDelta().toJson();

                // final newNote = NoteQuill(
                //   id: Random().nextDouble().toString(),
                //   titleNote: _formData['title'],
                //   note: json,
                // );
                //print(json);
              });
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Container(
        height: size.height,
        child: SingleChildScrollView(
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
                      height: size.height * 0.778,
                      width: size.width * 1,
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
                          RawKeyboardListener(
                            focusNode: FocusNode(),
                            onKey: (event) {
                              noteQuill.note = _controller.document.toDelta().toJson();
                              if (event.data.isControlPressed &&
                                  event.character == 'b') {
                                if (_controller
                                    .getSelectionStyle()
                                    .attributes
                                    .keys
                                    .contains('bold')) {
                                  _controller.formatSelection(
                                      quill.Attribute.clone(
                                          quill.Attribute.bold, null));
                                } else {
                                  _controller
                                      .formatSelection(quill.Attribute.bold);
                                }
                              }
                            },
                            //muda o focus sempre que abre o keyboard
                            child: quill.QuillEditor(
                              controller: _controller,
                              scrollController: ScrollController(),
                              scrollable: true,
                              focusNode: _noteFocusNode,
                              autoFocus: false,
                              readOnly: false,
                              expands: false,
                              padding: EdgeInsets.all(10),
                              customStyles: quill.DefaultStyles(
                                sizeSmall: const TextStyle(fontSize: 9),
                              ),
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
