import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notosuru/firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notosuru/screen/newnote.dart';
import 'package:notosuru/screen/note.dart';

import '../firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Noto Suru"),
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
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.grey[200],
        child:  StreamBuilder(
          stream: firestoreService.getNotesStream(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              List notesList = snapshot.data!.docs;

              return ListView.builder(
                itemCount: notesList.length,
                itemBuilder: (context, index){
                  DocumentSnapshot document = notesList[index];
                  String docID = document.id;


                  Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                  String noteTitle = data['title'];
                  String noteContent = data['content'];

                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Note(docID: docID, title: noteTitle, content: noteContent)),
                      );
                    },
                    child: Container(
                      height: 110.0,
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 7,
                            child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    data['title'],
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w800
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    data['content'],
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  )
                                )
                            ]),
                          ),
                          Expanded(
                            child: IconButton(
                              onPressed: () => firestoreService.deleteNote(docID), 
                              icon: const Icon(Icons.delete)
                            )
                          )
                        ],
                      )
                      
                    )
                  ); 
                }
              );
            } else {
              return const Text("No Notes");
            }
          }
        ),
      )
       
    );
  }
}