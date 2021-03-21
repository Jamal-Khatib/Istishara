import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/pages/Profile.dart';
import 'package:firebase_app/pages/list_of_categories.dart';
import 'package:firebase_app/pages/navigationClient.dart';
import 'package:firebase_app/pages/navigationExpert.dart';
import 'package:firebase_app/pages/verify.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:fluttertoast/fluttertoast.dart';

class AuthenticationProvider {
  final FirebaseAuth firebaseAuth;
  //FirebaseAuth instance

  AuthenticationProvider(this.firebaseAuth);
  //Constuctor to initalize the FirebaseAuth instance

  //Using Stream to listen to Authentication State
  Stream<User> get authState => firebaseAuth.idTokenChanges();

  //SIGN UP METHOD
  Future<void> signUp(
      {String email,
      String password,
      String phoneNumber,
      String name,
      bool isexpert,
      String field}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.to(Verify(), arguments: {
        "email": email,
        "password": password,
        "phoneNumber": phoneNumber,
        "name": name,
        "isexpert": isexpert,
        "field": field
      });
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: e.message,
          gravity: ToastGravity.CENTER,
          toastLength: Toast.LENGTH_LONG);
      print(e.message);
    }
  }

  //SIGN IN METHOD
  Future<void> logIn({String email, String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      DocumentSnapshot c = await FirebaseFirestore.instance
          .collection("users")
          .doc(firebaseAuth.currentUser.uid)
          .get();
      if (c["type"] == "client") {
        print("he is an client //provider");
        Get.off(navigationClient());
      } else {
        print("he is an expert //provider");
        Get.off(navigationExpert());
      }
    } on FirebaseAuthException catch (e) {
      // if (e.code == 'user-not-found') {
      //           print('No user found for that email.');
      // } else if (e.code == 'wrong-password') {
      //   print('Wrong password provided for that user.');
      //   }
      Fluttertoast.showToast(
          msg: e.message,
          gravity: ToastGravity.CENTER,
          toastLength: Toast.LENGTH_LONG);
    }
  }

  //SIGN OUT METHOD
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
