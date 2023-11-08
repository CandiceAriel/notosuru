import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //get collecton of notes
  final CollectionReference notes = FirebaseFirestore.instance.collection('notes');

  //ADD
  Future<void> addNote(String title, String content) {
    return notes.add(
      {
        'title': title,
        'content': content,
        'timestamp':Timestamp.now()
      }
    );
  }

  //READ
  Stream<QuerySnapshot> getNotesStream() {
    final notesStream = notes.snapshots();
    return notesStream;
  }
}