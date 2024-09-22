import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/helper/container_color.dart';
import 'package:notes_app/provider/note_provider.dart';
import 'package:notes_app/screens/add_note_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Notes',
                style: GoogleFonts.dancingScript(fontSize: 50),
              ),
              const SizedBox(height: 20),

              Expanded(
                child: Consumer<NoteProvider>(
                  builder: (context, noteProvider, child) {
                    if(noteProvider.notes.isEmpty) {
                      return const Center(child: Text('Notes is empty'),);
                    }
                
                    return ListView.separated(
                      itemCount: noteProvider.notes.length,
                      shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (_, __) => const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final note = noteProvider.notes[index];
                
                        return Dismissible(
                          key: UniqueKey(),
                          onDismissed: (direction) {
                            noteProvider.deleteNote(index);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ContainerColorHelper.colorHelper(index),
                            ),
                            child: Text(
                              note.title,
                              style: GoogleFonts.manrope(fontSize: 25, color: Colors.black),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddNoteScreen(),
            ),
          );
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
