part of 'note_bloc.dart';

@immutable
sealed class NoteEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class NoteFetched extends NoteEvent {}
