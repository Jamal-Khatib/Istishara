import 'package:firebase_app/chat/messages.dart';
import 'package:firebase_app/chat/new_message.dart';
import 'package:flutter/material.dart';
 


class Converstion extends StatefulWidget {

  String me ; 
  String other ; 
  Converstion({this.me,this.other}) ; 
  @override
  _ConverstionState createState() => _ConverstionState(me: me,other: other);
}

class _ConverstionState extends State<Converstion> {

  String me ; 
  String other ; 
  _ConverstionState({this.me,this.other}) ; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat!"),),
      body: Container(
        child: Column(children: [
          SizedBox(height: 20),
          Expanded(child: Messages(me: me,other: other)),
          NewMessage(me: me,other: other) 
        ],),
      ),
    );
  }
}




