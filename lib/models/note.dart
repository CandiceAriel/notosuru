import 'package:equatable/equatable.dart';
import 'package:notosuru/models/json_map.dart';
import 'package:uuid/uuid.dart';

final class Note {
  Note({
    required this.id,
    required this.title,
    this.content = '',
    this.date = ' '
  });

  String id;
  String title;
  String content;
  String date;

  /// Returns a copy of this `entry` with the given values updated.
  ///
  /// {@macro entry_item}
  Note copyWith({
    String? id,
    String? title,
    String? content,
    String? date,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      date: date ?? this.date,
    );
  }

  /// Deserializes the given [JsonMap] into a [Entry].
  // static Note fromJson(JsonMap json) => _$NoteFromJson(json);

  // /// Converts this [Entry] into a [JsonMap].
  // JsonMap toJson() => _$NoteToJson(this);
  // factory Note.fromSnapshot(Map<String, dynamic> snapshot) {
  //   return Note(
  //     id: snapshot['id'],
  //     title: snapshot['title'],
  //     content: snapshot['content'],
  //   );
  // }


  @override
  List<Object> get props => [id, title, content, date];
}