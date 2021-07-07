import 'package:flutter/material.dart';
import 'package:prac/providers/task_provider.dart';
import 'package:prac/screens/homepage_screen.dart';
import 'package:provider/provider.dart';


void main() => runApp(Tasks());

class Tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TaskProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Color(0xFFC94B4B),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: Colors.redAccent,
            ),
          ),
          fontFamily: 'Poppins',
        ),
        home: HomePageScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
