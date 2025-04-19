import 'package:absai/features/home/cubit/cubit.dart';
import 'package:absai/features/home/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// FUNCTION TO SHOW EDIT NOTE DIALOG
void showEditNoteDialog(BuildContext context, Note note) {
  final titleController = TextEditingController(text: note.title);
  final contentController = TextEditingController(text: note.content);

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => Dialog(
      insetPadding: EdgeInsets.all(20),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.85,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
                SizedBox(width: 8),
                Text(
                  'New Note',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Icon(Icons.attach_file_outlined),
                SizedBox(width: 10),
                Icon(Icons.person_add_alt),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    final updatedNote = Note(
                      id: note.id,
                      title: titleController.text,
                      content: contentController.text,
                      date: DateTime.now().toIso8601String(),
                      collaborators: note.collaborators,
                    );
                    context.read<NotesCubit>().editNote(updatedNote);
                    Navigator.pop(context);
                  },
                  child: Text('Save'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Title
            TextField(
              controller: titleController,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                hintText: 'Title',
                border: InputBorder.none,
              ),
            ),

            Row(
              children: [
                Icon(Icons.access_time, size: 16),
                SizedBox(width: 4),
                Text(
                    'Last edited: ${DateTime.now().toLocal().toString().split(' ')[0]}'),
                SizedBox(width: 16),
                Icon(Icons.people_alt_outlined, size: 16),
                SizedBox(width: 4),
                Text('${note.collaborators?.length ?? 1} collaborators'),
              ],
            ),
            SizedBox(height: 16),

            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.close, size: 16),
                  SizedBox(width: 8),
                  Text('Rich text editor toolbar will be implemented here'),
                ],
              ),
            ),
            SizedBox(height: 16),

            Expanded(
              child: TextField(
                controller: contentController,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  hintText: 'Start writing your note...',
                  border: InputBorder.none,
                ),
              ),
            ),

            Row(
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.image_outlined),
                  label: Text('Add Image'),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.check_box_outlined),
                  label: Text('Add Checklist'),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.link),
                  label: Text('Add Link'),
                ),
                Spacer(),
                Text('Auto-saving...'),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
void showAddNoteDialog(BuildContext context) {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text('Add Note'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title')),
          TextField(
              controller: contentController,
              decoration: InputDecoration(labelText: 'Content')),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            final note = Note(
              id: '',
              title: titleController.text,
              content: contentController.text,
              date: DateTime.now().toIso8601String(),
              collaborators: ['RJ'],
            );
            context.read<NotesCubit>().addNote(note);
            Navigator.pop(context);
          },
          child: Text('Add'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
      ],
    ),
  );
}