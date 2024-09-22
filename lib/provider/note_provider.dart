import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../model/note.dart';

class NoteProvider extends ChangeNotifier {
  final Box<Note> _noteBox = Hive.box('myNotes');

  List<Note> get notes => _noteBox.values.toList();

  void addNote(Note note) {
    _noteBox.add(note);
    notifyListeners();
  }

  void deleteNote(int index) {
    _noteBox.deleteAt(index);
    notifyListeners();
  }

  /// TextField Controllers
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  void _clearControllers() {
    titleController.clear();
    contentController.clear();
  }

  bool validateInputs() {
    return titleController.text.isNotEmpty && contentController.text.isNotEmpty;
  }

  void saveNote() {
    if (validateInputs()) {
      Note note = Note(
        title: titleController.text,
        content: contentController.text,
      );
      addNote(note);
      // _clearControllers();
    } else {}
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }
}
