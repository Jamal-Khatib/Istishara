import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/pages/allQuestions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
// import 'profile.dart';
import 'package:firebase_app/pages/user_controller.dart';
import 'package:image_picker/image_picker.dart';

class myProfile extends StatefulWidget {
  @override
  _myProfileState createState() => _myProfileState();
}

class _myProfileState extends State<myProfile> {
  @override
  UserController controller = Get.put(UserController());

  File pickedImageFile ; 

  PickedFile pickedImage ; 

  final picker = ImagePicker();

  Widget build(BuildContext context) {
    var counter = 10.obs;
    controller.getUser();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
            "My Profile",
            style: TextStyle(
              fontSize: 23,
              color: Colors.white,
            ),
          ),
        
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20),
          Center(
            child: Obx( () => CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.only(top: 85, left: 100),
                child: IconButton(
                  //highlightColor: Colors.grey,
                  color: Colors.grey[600],
                  //focusColor: Colors.grey[600],
                  icon: Icon(
                    Icons.mode_edit,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
              ),
              radius: 70,
              backgroundImage: controller.myUser.value.imageURL==""?  
              AssetImage("assets\\blank-profile-picture")
              : NetworkImage(controller.myUser.value.imageURL)               
              ,
                
              backgroundColor: Colors.blue,
            )),
          ),
          TextButton.icon( 
            onPressed: ()  async{
               pickedImage = await picker.getImage(source: ImageSource.gallery, imageQuality: 50) ;  
              setState(() async {

                if(pickedImage!=null) 
                {
                pickedImageFile = File(pickedImage.path) ;
                String s = pickedImage.hashCode.toString() ; 
                final ref =  FirebaseStorage.instance.ref().child("profiles").child("$s.jpg") ; 
                await ref.putFile(pickedImageFile) ; 
                String imageURL = await ref.getDownloadURL() ; 
                controller.myUser.value.imageURL = imageURL ; 
                FirebaseFirestore.instance.collection("users").doc(controller.myUser.value.uid).update(
                  {
                    "imageURL" : imageURL 
                  }
                ) ; 
                }
                else
                {
                  print("No image was picked siiiiiiiiiiiiiiiiiiiiiiiiiiii") ; 
                }

              });

            }, 
            icon: Icon(Icons.image), 
            label:  Text("Change image")),
          SizedBox(height: 20),
          Center(
            child: Container(
              child: Obx(
                () => Text(
                  "${controller.myUser.value.name}",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          // Center(
          //   child: Container(
          //     child: Obx(
          //       () => Text(
          //         "${controller.myUser.value.email}",
          //         style: TextStyle(
          //           fontSize: 20,
          //           color: Colors.blue[200],
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  //color: Colors.yellow[100],
                  border: Border.all(
                    color: Colors.grey[400],
                    // style: border_style_rounded,
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        " My Balance:  ",
                        style: TextStyle(
                          fontSize: AdaptiveTextSize()
                                  .getadaptiveTextSize(context, 23),
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Obx(
                        () => Text(
                          "$counter \$",
                          style: TextStyle(
                            fontSize: 23,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      IconButton(
                          //highlightColor: Colors.grey,
                          color: Colors.blue,
                          icon: Icon(
                            Icons.remove_circle,
                            size: 30,
                          ),
                          onPressed: () {
                            counter--;
                          }),
                      IconButton(
                          //highlightColor: Colors.grey,
                          color: Colors.blue,
                          icon: Icon(
                            Icons.add_circle,
                            size: 30,
                          ),
                          onPressed: () {
                            counter++;
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: Colors.black26,
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: StadiumBorder(
                //Card with stadium border
                side: BorderSide(
                  color: Colors.blue,
                  width: 2.0,
                ),
              ),
              child: InkWell(
                  onTap: () {},             
              
                              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      //Padding: EdgeInsets.all(value)
                      //mainAxisAlignment: MainAxisAlignment.,

                      children: <Widget>[
                        SizedBox(
                          width: 7,
                        ),
                        Icon(
                          Icons.notifications,
                          color: Colors.blue,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Notifications",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: StadiumBorder(
                //Card with stadium border
                side: BorderSide(
                  color: Colors.blue,
                  width: 2.0,
                ),
              ),
              child: InkWell(
                  onTap: () {},
                              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      //Padding: EdgeInsets.all(value)
                      //mainAxisAlignment: MainAxisAlignment.,

                      children: <Widget>[
                        SizedBox(
                          width: 7,
                        ),
                        Icon(
                          Icons.settings,
                          color: Colors.blue,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Notification Settings",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ),
          InkWell(
                  onTap: () {
                        Get.to(AllQuestions()) ; 

                  },
                      child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: StadiumBorder(
                  //Card with stadium border
                  side: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: <Widget>[
                    SizedBox(
                      width: 7,
                    ),
                    Icon(
                      Icons.live_help,
                      color: Colors.blue,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(AllQuestions()) ; 
                      },
                      child:
                       Text(
                        "My Questions",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ),
          InkWell(
                  onTap: () {
                         

                  },
                  
                      child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: StadiumBorder(
                  //Card with stadium border
                  side: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      //Padding: EdgeInsets.all(value)
                      //mainAxisAlignment: MainAxisAlignment.,

                      children: <Widget>[
                        SizedBox(
                          width: 7,
                        ),
                        Icon(
                          Icons.lock,
                          color: Colors.blue,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Password and Security",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ),
           InkWell(
                  onTap: () {
                         

                  },
                      child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: StadiumBorder(
                  //Card with stadium border
                  side: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      //Padding: EdgeInsets.all(value)
                      //mainAxisAlignment: MainAxisAlignment.,

                      children: <Widget>[
                        SizedBox(
                          width: 7,
                        ),
                        Icon(
                          Icons.info,
                          color: Colors.blue,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "About App",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ),
          InkWell(
                  onTap: () {
                         

                  },
                      child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: StadiumBorder(
                  //Card with stadium border
                  side: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    //Padding: EdgeInsets.all(value)
                    //mainAxisAlignment: MainAxisAlignment.,

                    children: <Widget>[
                      SizedBox(
                        width: 7,
                      ),
                      Icon(
                        Icons.contact_phone,
                        color: Colors.blue,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Contact Us",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}





class AdaptiveTextSize {
  const AdaptiveTextSize();

  getadaptiveTextSize(BuildContext context, dynamic value) {
    // 720 is medium screen height
    return (value / 720) * MediaQuery.of(context).size.height;
  }
}