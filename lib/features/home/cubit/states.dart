import 'package:absai/features/home/model.dart';

abstract class NotesState {}

class NotesInitialState extends NotesState {}

class NotesLoadingState extends NotesState {}

class NotesLoadedState extends NotesState {
  final List<Note> notes;
  NotesLoadedState(this.notes);
}

class NotesErrorState extends NotesState {
  final String message;
  NotesErrorState(this.message);
}
