import 'dart:convert';
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

  dynamic _note;
  bool _isLoadNote = false;
  //bool _isLoading = false;

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
        _formData['title'] = 'Nova Anotação';
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
        noteQuill != null ? _note = noteQuill.note : _note = templateNote;
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

  Future<void> _submitNote(NoteQuill noteQuill) async {
    final noteProvider = Provider.of<NoteProvider>(context, listen: false);
    if (!_keyForm.currentState.validate()) {
      return;
    }

    _keyForm.currentState.save();

    setState(() {
      if (noteQuill != null) {
        noteQuill.note = _controller.document.toDelta().toJson();
        noteQuill.titleNote = _formData['title'];
      } else {
        _note = _controller.document.toDelta().toJson();
        noteProvider.addNote(
          _formData['title'],
          _note,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final NoteQuill noteQuill = ModalRoute.of(context).settings.arguments;
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black87,
        ),
        backgroundColor: Colors.grey[50],
        elevation: 0.2,
        title: Text(
          _formData['title'],
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.check,
              color: Colors.black87,
            ),
            onPressed: () => _submitNote(noteQuill),
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
                            focusNode: _titleFocusNode,
                            decoration: InputDecoration(
                              labelText: 'Título',
                              contentPadding: EdgeInsets.all(10),
                            ),
                            onChanged: (value) => _formData['title'] = value,
                            validator: (value) {
                              if (value.isEmpty || value == null) {
                                return 'Insira um título válido';
                              }
                              return null;
                            },
                          ),
                          Container(
                            height: _size.height * 0.670,
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
