part of 'note_bloc.dart';

sealed class NoteEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchNotes extends NoteEvent {}

class NotesFetchingLoadingState extends NoteEvent {}

class ViewDetailNoteEvent extends NoteEvent {}
