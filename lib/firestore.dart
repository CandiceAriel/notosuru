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
        'dateCreated':Timestamp.now()
      }
    );
  }

  //READ
  Stream<QuerySnapshot> getNotesStream() {
    final notesStream = notes.snapshots();
    return notesStream;
  }

  //UPDATE
  Future<void> updateNote( String docID, String newTitle, String newContent){
    return notes.doc(docID).update({
      'title': newTitle,
      'content': newContent,
      'dateCreated': Timestamp.now()
    });
  }

  //DELETE
  Future<void> deleteNote(String docID){
    return notes.doc(docID).delete();
  }
}