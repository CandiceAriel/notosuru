import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:notosuru/models/note.dart';
import 'package:notosuru/repo/entry_repository.dart';

part 'note_event.dart';
part 'note_state.dart';

class NotesBloc extends Bloc<NoteEvent, NoteState> {
  final CollectionReference _notes = FirebaseFirestore.instance.collection('notes');
  
  NotesBloc({
    required NotesRepository notesRepository,
  }) : _notesRepository = notesRepository,
    super(const NoteState()) {
      on<FetchNotes>(_onFetchNotes);
    }

  final NotesRepository _notesRepository;

  Future<void> _onFetchNotes(
    FetchNotes event,
    Emitter<NoteState> emit,
  ) async {
    try {
        emit(NotesLoading());
        final notes = await _notesRepository.getNotesStream().first;
        emit(NotesFetched(notes));
      } catch (e) {
        emit(FetchingError('Failed to load todos.'));
      }

    
  }

  
}
