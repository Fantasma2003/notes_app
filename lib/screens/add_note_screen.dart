import 'package:flutter/material.dart';
import 'package:notes_app/provider/note_provider.dart';
import 'package:provider/provider.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: noteProvider.titleController,
              style: const TextStyle(fontSize: 20),
              maxLines: null,
              decoration: const InputDecoration(
                hintText: 'Title',
                hintStyle: TextStyle(fontSize: 45),
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: TextField(
                controller: noteProvider.contentController,
                maxLines: null,
                style: const TextStyle(fontSize: 20),
                textAlignVertical: TextAlignVertical.top, // Align text to the top
                decoration: const InputDecoration(
                  hintText: 'Type Something...',
                  hintStyle: TextStyle(fontSize: 30), // Larger hint text
                  border: InputBorder.none,
                  isCollapsed: true, // Shrink the input area when text is typed
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          noteProvider.saveNote();
          Navigator.pop(context);
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
