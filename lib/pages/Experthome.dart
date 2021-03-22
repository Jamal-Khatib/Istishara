import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/pages/experthome_controller.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/authenticationProvider.dart';
import 'package:firebase_app/pages/log_in.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:firebase_app/pages/user_controller.dart';


class Experthome extends StatelessWidget {
  List questions = myquestionlst();
  List dates = datelst();
  List bides = bidelst();
  UserController controller = Get.put(UserController());

  PickController pcontroller = Get.put(PickController()) ; 

  Widget build(BuildContext context) {
    controller.getUser() ; 
    return Scaffold(
        appBar: AppBar(
          // leading: Container(height: 0,width: 0,),
          title: Text("Questions"),
          actions: <Widget>[
           RaisedButton.icon(
            color: Colors.blue,
            icon: Icon(Icons.login),
            onPressed: () {
              context.read<AuthenticationProvider>().signOut();
              Get.off(Login());
            },
            label: Text(
              "Log out",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 15,
              ),
            )),
          ],
        ),
        body: Container(
          child:StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        return new ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            if(document.data()["type"]=="client" && document.data()["${controller.myUser.value.field}"] != "") 
            {
              String s = "${controller.myUser.value.field}" ;
              print("heyyyyyyyyyyyyyyyyyyyyyyyy")  ; 
              print(s) ; 
              return  Card(
                child: Column(
                children: [
                  Text(document.data()["name"],style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(height: 15),
                  Text(document.data()[s]),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton.icon(
                       icon: "${pcontroller.s}"=="Pick" ? Icon(Icons.library_add_check_rounded) : Icon(Icons.cancel),
                       onPressed: () { pcontroller.change() ; },
                       label :  Obx(() => Text("${pcontroller.s}"))
                      ),
                    ],
                  )

                ],
            ),
              );
            }
            else 
            {
              return Container() ; 
            }
            // return new ListTile(
            //   title: new Text(document.data()['name']),
            //   // subtitle: new Text(document.data()['company']),
            // );
            
          }).toList(),
        );
      },
    ),
        ));
  }

  static List myquestionlst() {
    List list = List.generate(10, (i) {
      return "Question ${i + 1}";
    });
    return list;
  }

  static List datelst() {
    List list = List.generate(10, (i) {
      return "${i + 1} days ago";
    });
    return list;
  }

  static List bidelst() {
    List list = List.generate(10, (i) {
      return "${i + 1} bides";
    });
    return list;
  }
}



              // Divider(color: Colors.black),







