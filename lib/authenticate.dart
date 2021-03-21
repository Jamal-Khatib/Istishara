// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/pages/navigationClient.dart';
import 'package:firebase_app/pages/navigationExpert.dart';
import 'package:firebase_app/pages/user_controller.dart';
// import 'package:firebase_app/pages/Profile.dart';
import 'package:firebase_app/pages/list_of_categories.dart';
import 'package:firebase_app/pages/log_in.dart';
// import 'package:firebase_app/pages/verify.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class Authenticate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Instance to know the authentication state.
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      print(firebaseUser.uid);
      //Means that the user is logged in already and hence navigate to HomePage
      UserController controller = Get.put(UserController());

      print("Payyyyy attention");
      print(controller.myUser.value.type);
      if (controller.myUser.value.type == "client") {
        return (navigationClient());
      } else if (controller.myUser.value.type == "expert") {
        return (navigationExpert());
      } else {
        return (Login());
      }
    } else {
      //The user isn't logged in and hence navigate to SignInPage.
      return Login();
    }
  }
}
