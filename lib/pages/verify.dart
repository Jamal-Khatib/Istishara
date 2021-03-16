import 'package:firebase_app/pages/categories_build.dart';
import 'package:firebase_app/pages/list_of_categories.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_app/authenticationProvider.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'ask_question.dart';
import 'navigationClient.dart';

class Verify extends StatefulWidget {
  @override
  _VerifyState createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  Timer timer;
  User user;
  final auth = FirebaseAuth.instance;

  @override
  void initState() {
    user = auth.currentUser;
    // Provider.of<AuthenticationProvider>(context).firebaseAuth.currentUser.sendEmailVerification();
    user.sendEmailVerification();

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

      Get.off(navigationClient());
    }
  }
}
