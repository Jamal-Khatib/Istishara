import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/chat/messages.dart';
import 'package:firebase_app/chat/new_message.dart';
import 'package:firebase_app/pages/RateMe.dart';
import 'package:firebase_app/pages/user_controller.dart';
import 'package:flutter/material.dart';
 import 'package:get/get.dart';



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


  Future<String> getImage() async
  {
     final x = await FirebaseFirestore.instance.collection("users").where("name", isEqualTo: other).get() ; 
    final l = x.docs ; 
    final d = l.first ; 
    var url  = d.data()["imageURL"] ; 
    return(url) ; 

  }
      UserController controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
     appBar: AppBar(
        leading: FutureBuilder<String>(
            future: getImage(),
            builder: (context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data == "")
                  return CircleAvatar(
                      backgroundImage:
                          AssetImage("assets\\blank-profile-picture"));
                else
                  return Column(children: [
                    Container(
                        padding: EdgeInsets.fromLTRB(5, 13, 3, 2),
                        child: CircleAvatar(
                            backgroundImage: NetworkImage(snapshot.data)))
                  ]);
              } else {
                return CircularProgressIndicator();
              }
            }),
        leadingWidth: 40,
        title: Row(
          children: <Widget>[
            Text("$other"),
            SizedBox(width: 73),
            controller.myUser.value.type=="expert"? Container() :TextButton(
              child: Text("Rate Me",
                  style: TextStyle(
                    color: Colors.white,
                  )),
              onPressed: () {
                Get.to(RateMe(name:other)); 
              },
            )
          ],
        ),
      ),
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




