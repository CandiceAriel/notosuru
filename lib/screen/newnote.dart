import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notosuru/firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class NewNote extends StatefulWidget {
  const NewNote({super.key});

  @override
  State<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  final FirestoreService firestoreService = FirestoreService();
  final TextEditingController titleTextController = TextEditingController();
  final TextEditingController contentTextController = TextEditingController();
  
  void showSnackbar(){
     final snackBar = SnackBar(
            content: const Text('Note added successfully'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );

          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar.
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Note"),
        actions: [
          ElevatedButton(
            onPressed: (){
              firestoreService.addNote(titleTextController.text, contentTextController.text);

              titleTextController.clear();
              contentTextController.clear();
              showSnackbar();

              Navigator.pop(context);
            }, 
            child: Text('Save')
          )
        ],
      ),
      body: Container(
         padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: titleTextController,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w800
              ),
              decoration: const InputDecoration(
                hintText: 'Title',
                border: InputBorder.none
              ),
              
            ),
            TextFormField(
              controller: contentTextController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Write your thoughts',
              ),
            ),
          ]
        ),
      ),
    );
  }
}