import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notosuru/bloc/note_bloc.dart';
import 'package:notosuru/firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notosuru/screen/newnote.dart';
import 'package:notosuru/screen/note.dart';
import 'package:notosuru/screen/notes_view.dart';

import '../firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirestoreService firestoreService = FirestoreService();

  @override
  void initState() {
    BlocProvider.of<NotesBloc>(context).add(FetchNotes());
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Noto Suru"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Note(docID: '', title: '', content: '',)),
          );
        },
         foregroundColor: Colors.white,
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.note_add),
      ),
      body: NotesView()
       
    );
  }
}