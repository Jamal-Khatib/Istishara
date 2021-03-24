import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/pages/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_app/pages/user.dart';


class UserController extends GetxController { 


  UserController controller = Get.put(UserController());
  var experts =  1 ; 


   @override
  void onInit() async {
    super.onInit();
   
   experts = controller.my.value.interestedDoctor ; 

  }



}