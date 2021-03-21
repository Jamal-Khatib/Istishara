import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/pages/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var myUser = MyUser().obs;

  @override
  void onInit() async {
    super.onInit();
    print("111111111111");
    getUser();
    print("2222222222222222222");
  }

  void getUser() async {
    try {
      DocumentSnapshot c = await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser.uid)
          .get();
      Map<String, dynamic> myMap = c.data();
      print(
          "This issssssssssssssssssssssssssssssssssssssssssssssssssssss user controller");
      print(c.data()["type"]);
      if (myMap["type"] == "client") {
        myUser.update((value) {
          value.name = c["name"];
          value.email = c["email"];
          value.phoneNumber = c["phoneNumber"];
          value.type = "client";
        });
        update();
      } else if (myMap["type"] == "expert") {
        myUser.update((value) {
          value.name = c["name"];
          value.email = c["email"];
          value.phoneNumber = c["phoneNumber"];
          value.type = "expert";
          value.field = c["field"];
        });
        update();
      } else {
        print("There is something in User controller");
      }
    } catch (e) {
      print("fi error wlakkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
      print(e);
    }
  }
}
