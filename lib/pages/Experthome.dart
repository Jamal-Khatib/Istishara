import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_app/pages/experthome_controller.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/authenticationProvider.dart';
import 'package:firebase_app/pages/log_in.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:firebase_app/pages/user_controller.dart';

import 'package:fluttertoast/fluttertoast.dart';




class Experthome extends StatelessWidget {
 
  UserController controller = Get.put(UserController());


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
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot)   {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text("Loading"));
        }
        return new ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            if(document.data()["type"]=="client" && document.data()["${controller.myUser.value.field}"] != "" &&  document.data()["${controller.myUser.value.field}"] != null) 
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
                  // Text( controller.si(ClientId: document.id)),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton.icon  (
                        color: Colors.blue,
                        icon:   Icon(Icons.library_add_check_rounded,color: Colors.white) ,
                       onPressed: () {
                         String f = "${controller.myUser.value.field}".capitalize ; 
                         print("interested$f") ; 
                         List l = document.data()["interested$f"] ; 
                         for(var i = 0 ; i<l.length ; i++) 
                         {
                           if(l[i]==controller.myUser.value.name) 
                           {
                             Fluttertoast.showToast(
                               msg: "You have already picked this question",
                              gravity: ToastGravity.CENTER,
                              toastLength: Toast.LENGTH_LONG,
                              fontSize: 15,
                              
                              ) ; 
                              return ; 
                           }
                         }
        
                         l.add(controller.myUser.value.name.toString()) ; 
                         FirebaseFirestore.instance.collection('users').doc(document.id).update(
                           {
                             "interested$f" : l,
                           }
                        
                         ) ; 
                         Fluttertoast.showToast(
                               msg: "You have pickesd this question successfully", //yalla
                              gravity: ToastGravity.CENTER,
                              toastLength: Toast.LENGTH_LONG,
                              fontSize: 15,
                              
                              ) ; 
                        // document.data()["interested$f"].se     add(controller.myUser.value.uid) ; 
                          },
                      label :  Text("Pick",style: TextStyle(color: Colors.white),)
                      ),
                      SizedBox(width: 20),
                      RaisedButton.icon  (
                        icon:   Icon(Icons.cancel) ,
                       onPressed: () {
                         String f = "${controller.myUser.value.field}".capitalize ; 
                         print("interested$f") ; 
                         List l = document.data()["interested$f"] ; 
                         int c = 0 ; 
                         for(var i = 0 ; i<l.length ; i++) 
                         {
                           if(l[i]==controller.myUser.value.name) 
                           {
                             
                             c++; 
                           }
                         }
                         if(c==0) 
                         {
                           Fluttertoast.showToast(
                               msg: "You have not picked this question yet to cancel it ", 
                              gravity: ToastGravity.CENTER,
                              toastLength: Toast.LENGTH_LONG
                              ) ; 
                            return ; 
                         }
                         else
                         {
                           l.remove(controller.myUser.value.name) ; 

                         FirebaseFirestore.instance.collection('users').doc(document.id).update(
                           {
                             "interested$f" : l,
                           }
                         ) ; 
                          Fluttertoast.showToast(
                               msg: "You have canceled your pick for this question successfully",   ///yalla
                              gravity: ToastGravity.CENTER,
                              toastLength: Toast.LENGTH_LONG,
                              fontSize: 15,
                              
                              ) ; 
                         }
                         
                          },
                       label :  Text("Cancel")
                      ),

                    ], 
                  ),
                   Divider(color: Colors.blue,thickness: 5,),
                ],
            ),
              );
            }
            else 
            {
              return Container() ; 
            }
          }).toList(),
        );
      },
    ),
        ));
  }



              // Divider(color: Colors.black),


}




