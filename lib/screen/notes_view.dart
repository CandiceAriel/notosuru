import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notosuru/bloc/note_bloc.dart';
import 'package:notosuru/widgets/notes_empty.dart';

class NotesView extends StatelessWidget {
  NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesBloc, NoteState>(
        builder: (context, state){
          if(state.notes.isEmpty){
            return const Center(
                  child: Text(
                    "No Data",
                  ),
                );
          } 
          
          return const Column(
            children: [
              Text('Data')
            ],
          );
        }
    );
  }
}