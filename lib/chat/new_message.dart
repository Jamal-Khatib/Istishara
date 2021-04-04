import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_app/pages/user_controller.dart';


class NewMessage extends StatefulWidget {
  
  String me ; 
  String other ; 
  NewMessage({this.me,this.other}) ; 
  @override
  _NewMessageState createState() => _NewMessageState(me: me,other: other);
}

class _NewMessageState extends State<NewMessage> {
  final UserController controller = Get.put(UserController());
  String me ; 
  String other ; 
  _NewMessageState({this.me,this.other}) ; 

  var enteredMessage = "" ; 

  final mycontroller = new TextEditingController() ; 

  

  void sendMessage(String me, String other) async
  {
    FocusScope.of(context).unfocus() ; 
    // var user = await FirebaseAuth.instance.currentUser ; 
    String collection ; 
    controller.myUser.value.type=="client" ? collection = me+"_"+other : collection = other+"_"+me ; 
    // 
    FirebaseFirestore.instance.collection("$collection").add(
      {
        "text" : enteredMessage, 
        "time" :  Timestamp.now(), //created time
        "uid" : FirebaseAuth.instance.currentUser.uid

      }
    ) ; 
    mycontroller.clear() ; 
   
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: mycontroller,
              decoration: InputDecoration(labelText: "Send a message..."),
              onChanged: (value) {
                setState(() {
                    enteredMessage = value ; 
                                });
              },
            ),
          ),
          IconButton(
            color: Colors.blue,
            icon: Icon(Icons.send),
            onPressed:  enteredMessage.trim().isEmpty?  null : ()  { sendMessage(me,other) ; }, 
            )
        ],
      ),
    );
  }
}