import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prac/providers/note_provider.dart';
import 'package:prac/providers/task_provider.dart';
import 'package:prac/utils/app_routes.dart';
import 'package:prac/views/add_note_page.dart';
import 'package:prac/views/home_page.dart';
import 'package:prac/views/notes_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(Tasks());

class Tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TaskProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NoteProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.redAccent,
            selectionColor: Colors.red[100],
            selectionHandleColor: Colors.redAccent,
          ),
          primarySwatch: Colors.red,
          primaryColor: Colors.redAccent,
          accentColor: Colors.redAccent,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: Colors.redAccent,
            ),
          ),
          fontFamily: 'Poppins',
        ),
        routes: {
          AppRoutes.HOME_PAGE: (context) => HomePage(),
          AppRoutes.NOTES_PAGE: (context) => NotesPage(),
          AppRoutes.ADD_NOTES_PAGE: (context) => AddNotePage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
