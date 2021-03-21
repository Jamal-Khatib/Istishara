// import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/pages/Profile.dart';
// import 'package:firebase_app/models/client.dart';
// import 'package:firebase_app/models/expert.dart';
// import 'package:firebase_app/pages/categories_build.dart';
import 'package:firebase_app/pages/list_of_categories.dart';
import 'package:firebase_app/pages/navigationExpert.dart';
import 'package:firebase_app/pages/sign_up.dart';
// import 'package:firebase_app/pages/testpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:firebase_app/authenticationProvider.dart';
import 'dart:async';
import 'package:get/get.dart';

import 'navigationClient.dart';
// import 'ask_question.dart';

class Verify extends StatefulWidget {
  @override
  _VerifyState createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  Timer timer;
  User user;
  final auth = FirebaseAuth.instance;
  Map data;

  @override
  void initState() {
    super.initState();
    user = auth.currentUser;
    // Provider.of<AuthenticationProvider>(context).firebaseAuth.currentUser.sendEmailVerification();
    user.sendEmailVerification();

    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailVerified();
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AlertDialog(
          backgroundColor: Colors.grey[200],
          title: Text(
            "Email Confirmation",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'An email has been sent to ${user.email}. ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'Please verify your email.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser;

    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      Map data = Get.arguments;
      if (data["isexpert"]) {
        // Expert expert = Expert(name: data["name"], email: data["email"], phonenumber: data["phoneNumber"],field: data["field"]) ;
        FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser.uid)
            .set({
          "name": data["name"],
          "email": data["email"],
          "phoneNumber": data["phoneNumber"],
          "field": data["field"],
          "type": "expert"
        });
        Get.off(navigationExpert());
      } else {
        // Client client = Client(name: data["name"], email: data["email"], phonenumber: data["phoneNumber"]) ;
        FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser.uid)
            .set({
          "name": data["name"],
          "email": data["email"],
          "phoneNumber": data["phoneNumber"],
          "type": "client"
        });
        Get.off(navigationClient());
      }
    }
  }
}
