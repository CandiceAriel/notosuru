import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notosuru/firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notosuru/screen/newnote.dart';

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
    return docID!='' && title!= '' && content!='' ? Scaffold(
      appBar: AppBar(
        title: Text("New Note"),
        actions: [
          ElevatedButton(
            onPressed: (){
              firestoreService.updateNote(docID , titleTextController.text, contentTextController.text);
               Navigator.pop(context);
            }, 
            child: Text('Save'),
           
          )
        ],
      ),
      body: Container(
         padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              //initialValue: widget.title,
              controller: titleTextController..text= title,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w800
              ),
            ),
            TextFormField(
              //initialValue: content,
              controller: contentTextController..text= content,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Write your thoughts',
              ),
            ),
          ]
        ),
      ),
    ) : NewNote();
  }
}