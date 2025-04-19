import 'package:absai/features/home/cubit/cubit.dart';
import 'package:absai/features/home/model.dart';
import 'package:absai/features/home/view/widgets/show_dailog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteCard extends StatelessWidget {
  final Note note;

  NoteCard({required this.note});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text(note.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16))),
                Row(
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.edit,
                          size: 18,
                          color: Colors.grey,
                        ),
                        onPressed: () => showEditNoteDialog(context, note)),
                    IconButton(
                      icon: Icon(Icons.delete_outline,
                          size: 18, color: Colors.grey),
                      onPressed: () =>
                          context.read<NotesCubit>().deleteNote(note.id),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 8),
            Text(note.content, maxLines: 3, overflow: TextOverflow.ellipsis),
            Spacer(),
            Text('Edited ${note.date}', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 8),
            Row(
              children: note.collaborators
                  .map((c) => Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: CircleAvatar(
                    radius: 10,
                    child: Text(c, style: TextStyle(fontSize: 10))),
              ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
