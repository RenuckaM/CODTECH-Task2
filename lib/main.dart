import 'package:flutter/material.dart';
import 'package:notes_app_codetech/screens/NoteScreen.dart';
import 'package:notes_app_codetech/screens/NotesScreen.dart';
import 'AppTheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Note Taking app',
      theme: appTheme,
      routes: {
        NotesScreen.route: (context) => const NotesScreen(),
        NoteScreen.route: (context) => const NoteScreen()
      },
      initialRoute: NotesScreen.route,
    );
  }
}
