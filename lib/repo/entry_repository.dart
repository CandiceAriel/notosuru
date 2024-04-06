import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notosuru/models/note.dart';

class NotesRepository {
  final CollectionReference notes = FirebaseFirestore.instance.collection('notes');


  //READ
  Stream<List<Note>> getNotesStream() {
   final fetchedNotes =  notes.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Note(
          id: doc.id,
          title: data['title'],
          content: data['content'],
          date: data['dateCreated']
        );
      }).toList();
    });
    return fetchedNotes;
  }
}
