import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //get collecton of notes
  final CollectionReference notes = FirebaseFirestore.instance.collection('notes');

  //READ
  Stream<QuerySnapshot> getNotesStream() {
    final notesStream = notes.orderBy('dateCreated', descending: true).snapshots();

    return notesStream;
  }
}