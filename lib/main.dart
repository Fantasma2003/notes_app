import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/model/note.dart';
import 'package:notes_app/provider/note_provider.dart';
import 'package:notes_app/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart' as path;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await path.getApplicationDocumentsDirectory();
  await Hive.initFlutter();

  Hive.registerAdapter<Note>(NoteAdapter());
  await Hive.openBox<Note>('myNotes');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NoteProvider(),
        )
      ],
      child: const NoteApp(),
    ),
  );
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      darkTheme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black54),
      home: const HomeScreen(),
    );
  }
}
