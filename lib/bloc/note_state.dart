part of 'note_bloc.dart';

enum NoteStatus { initial, loading, success, failure } 

extension WeatherStatusX on NoteStatus {
  bool get isInitial => this == NoteStatus.initial;
  bool get isLoading => this == NoteStatus.loading;
  bool get isSuccess => this == NoteStatus.success;
  bool get isFailure => this == NoteStatus.failure;
}

final class NoteState extends Equatable{
  const NoteState({
    this.status = NoteStatus.initial,
    this.notes = const <Note>[],
  });


  final NoteStatus status;
  final List<Object?> notes;

  NoteState copyWith({
    NoteStatus? status,
    List<Note>? notes,
  }) {
    return NoteState(
      status: status ?? this.status,
      notes: notes ?? this.notes,
    );
  }

  @override
  List<Object?> get props => [
    status,
    notes,
  ];
}

// @immutable
// abstract class NoteState {}

final class NotesInitial extends NoteState {}

final class NotesLoading extends NoteState {}

final class NotesFetched extends NoteState {
  final List<Note> notes;
  NotesFetched(this.notes);

   @override
  List<Object?> get props => [notes];
}

final class FetchingError extends NoteState {
  final String errorMessage;

  FetchingError(this.errorMessage);
}