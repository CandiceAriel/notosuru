import 'package:equatable/equatable.dart';

final class Note extends Equatable {
  const Note({required this.id, required this.title, required this.content});

  final String id;
  final String title;
  final String content;

  @override
  List<Object> get props => [id, title, content];
}