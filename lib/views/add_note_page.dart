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
  final _focusNode = FocusNode();

  quill.QuillController _controller = quill.QuillController.basic();

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
                print(noteQuill.note);
                noteQuill.note = _controller.document.toDelta().toJson();
                print(noteQuill.note);
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
                          ),
                          Expanded(
                            child: quill.QuillEditor(
                              controller: _controller,
                              scrollController: ScrollController(),
                              scrollable: true,
                              focusNode: _focusNode,
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
