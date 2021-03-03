import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/pages/log_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [
          RaisedButton(
            child: Text("Log out "), 
            onPressed: () async {
              await FirebaseAuth.instance.signOut() ; 
              Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
            },

          )
        ],
      ),
      body: Column(children: [
        RaisedButton(
            child: Text("Post"), 
            onPressed: ()   {
             var curentUser =  FirebaseAuth.instance.currentUser ; 
             print(curentUser.uid) ; 
            },

          )
      ],),
    );
  }
}



