import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:prac/models/note.dart';

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
        actions: [
          IconButton(
            onPressed: () {},
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
