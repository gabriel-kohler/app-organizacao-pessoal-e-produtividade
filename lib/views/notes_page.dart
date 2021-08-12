import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prac/components/clipper.dart';
import 'package:prac/components/note_item.dart';
import 'package:prac/data/dummy_data.dart';
import 'package:prac/models/note_quill.dart';
import 'package:prac/utils/app_routes.dart';

class NotesPage extends StatelessWidget {
  final _notesList = DUMMY_NOTES;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Notes'),
      //   actions: [
      //     IconButton(
      //       onPressed: () =>
      //           Navigator.of(context).pushNamed(AppRoutes.ADD_NOTES_PAGE),
      //       icon: Icon(Icons.add),
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                padding: const EdgeInsets.only(left: 15, top: 30, right: 20),
                height: _size.height * 0.5,
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
                    Expanded(
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/img/imgnotepage-grande.png',
                            width: _size.width * 0.59,
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
              height: _size.height * 0.5,
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _notesList.length,
                  itemBuilder: (ctx, index) {
                    final NoteQuill notes = _notesList[index];
                    return NoteItem(note: notes);
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
