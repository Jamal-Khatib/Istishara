import 'package:firebase_app/pages/list_of_categories.dart';
import 'package:firebase_app/pages/log_in.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class Authenticate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Instance to know the authentication state.
    final firebaseUser = context.watch<User>();
    
    if (firebaseUser != null) {
      //Means that the user is logged in already and hence navigate to HomePage
      return ListCategories();
    }
    //The user isn't logged in and hence navigate to SignInPage.
    return Login();
  }
}


