import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prac/components/clipper.dart';
import 'package:prac/components/note/note_item.dart';
import 'package:prac/models/note_quill.dart';
import 'package:prac/providers/note_provider.dart';
import 'package:prac/utils/app_routes.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    final _noteProvider = Provider.of<NoteProvider>(context);
    final List<NoteQuill> _notesList = _noteProvider.notes;
    final _size = MediaQuery.of(context).size;

    

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                padding: EdgeInsets.only(left: 15, top: _size.height * 0.05, right: 20),
                height: _size.height * 0.6,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      const Color(0xFFC94B4B),
                      const Color(0xFF4b134f),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: _size.height * 0.035),
                    Align(
                      alignment: Alignment.topRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () => Navigator.of(context)
                                .pushNamed(AppRoutes.HOME_PAGE),
                            child: Text(
                              'TASKS',
                              style: GoogleFonts.nunito(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          InkWell(
                            child: Image.asset(
                              'assets/img/img10.png',
                              width: 20,
                              height: 20,
                            ),
                            onTap: () => Navigator.of(context)
                                .pushNamed(AppRoutes.ADD_NOTES_PAGE),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: _size.height * 0.04),
                    Expanded(
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/img/img8.png',
                            width: _size.width * 0.59,
                            height: _size.height * 0.59,
                            alignment: Alignment.topLeft,
                            fit: BoxFit.fitWidth,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: _size.height * 0.4,
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ReorderableListView.builder(
                  shrinkWrap: true,
                  itemCount: _notesList.length,
                  itemBuilder: (ctx, index) {
                    final NoteQuill note = _notesList[index];
                    return Container(
                      key: ValueKey(note),
                      child: NoteItem(note),
                    );
                  },
                  onReorder: (oldIndex, newIndex) {
                    setState(() {
                      if (newIndex > oldIndex) {
                        newIndex = newIndex - 1;
                      }
                      final element = _notesList.removeAt(oldIndex);
                      _notesList.insert(newIndex, element);
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
