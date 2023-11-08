import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notosuru/firestore.dart';
import 'package:google_fonts/google_fonts.dart';

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
        onPressed: (){},
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

                  return Container(
                    height: 100.0,
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    padding: const EdgeInsets.all(20),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Text(
                          data['title'],
                          style: GoogleFonts.nunitoSans(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w800
                          ),
                        ),
                        Text(data['dateCreated'].toString())
                    ]),
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