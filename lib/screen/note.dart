import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notosuru/firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class Note extends StatefulWidget {
  Note({Key? key, required this.docID, required this.title, required this.content}) : super(key: key);
  final String docID;
  final String title;
  final String content;

  @override
  State<Note> createState() => _NoteState(docID, title, content);
}

class _NoteState extends State<Note> {
  final FirestoreService firestoreService = FirestoreService();
  final TextEditingController titleTextController = TextEditingController();
  final TextEditingController contentTextController = TextEditingController();
   String docID;
   String title;
   String content;
  _NoteState(this. docID, this.title, this.content);  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Note"),
        actions: [
          ElevatedButton(
            onPressed: (){
              firestoreService.updateNote(docID , titleTextController.text, contentTextController.text);
            }, 
            child: Text('Save')
          )
        ],
      ),
      body: Container(
         padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              initialValue: title,
              controller: titleTextController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              
            ),
            TextFormField(
              initialValue: content,
              controller: contentTextController,
              decoration: const InputDecoration(
                labelText: 'Write your thoughts',
              ),
            ),
          ]
        ),
      ),
    );
  }
}