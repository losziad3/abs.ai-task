import 'package:absai/features/home/cubit/states.dart';
import 'package:absai/features/home/model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class NotesCubit extends Cubit<NotesState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  NotesCubit() : super(NotesInitialState());

  ///FUNCTIONS TO LOAD THE NOTES AFTER EVERY PROCESS
  void loadNotes() async {
    emit(NotesLoadingState());
    try {
      ///I NAMED THE COLLECTIONS NOTES
      final snapshot = await _firestore.collection('notes').get();
      final notes = snapshot.docs.map((doc) => Note.fromMap(doc.data(), doc.id)).toList();
      emit(NotesLoadedState(notes));
    } catch (e) {
      emit(NotesErrorState('Failed to load notes'));
    }
  }

  void addNote(Note note) async {
    try {
      await _firestore.collection('notes').add(note.toMap());
      loadNotes();
    } catch (e) {
      emit(NotesErrorState('Failed to add note'));
    }
  }

  void deleteNote(String id) async {
    try {
      await _firestore.collection('notes').doc(id).delete();
      loadNotes();
    } catch (e) {
      emit(NotesErrorState('Failed to delete note'));
    }
  }

  void editNote(Note note) async {
    try {
      await _firestore.collection('notes').doc(note.id).update(note.toMap());
      loadNotes();
    } catch (e) {
      emit(NotesErrorState('Failed to edit note'));
    }
  }
}
