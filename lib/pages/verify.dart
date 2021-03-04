import 'package:firebase_app/pages/categories_build.dart';
import 'package:firebase_app/pages/list_of_categories.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_app/authenticationProvider.dart';
import 'dart:async';

class Verify extends StatefulWidget {
  @override
  _VerifyState createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {

  Timer timer ; 
  User user ; 
  final auth = FirebaseAuth.instance ; 

  @override
  void initState() {
    user = auth.currentUser;
    // Provider.of<AuthenticationProvider>(context).firebaseAuth.currentUser.sendEmailVerification(); 
    user.sendEmailVerification() ; 

    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailVerified();
    });
    super.initState();
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
        child: Text(
            'An email has been sent to ${user.email} please verify'),
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser;
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => ListCategories()));
    }
  }
}