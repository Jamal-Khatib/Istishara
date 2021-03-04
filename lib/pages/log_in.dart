import 'package:firebase_app/pages/list_of_categories.dart';
import 'package:firebase_app/pages/reset.dart';
import 'package:firebase_app/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/authenticationProvider.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Login extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   // backgroundColor: Colors.blue,
        //   elevation: 0,
        // ),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Image.asset(
                "assets/images/signup.png",
                fit: BoxFit.cover,
                height: 300,
                width: 300,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15.0, bottom: 0),
                child: new Theme(
                  data: new ThemeData(
                    primaryColor: Colors.blue,
                    primaryColorDark: Colors.blue,
                  ),
                  child: TextField(
                    controller: emailController,
                    decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.blue)),

                      // border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
              ),
              SizedBox(
                  height: 10.0,
                  width: 150.0,
                  child: Divider(
                    color: Colors.white,
                  )),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15.0, bottom: 0),
                child: new Theme(
                  data: new ThemeData(
                    primaryColor: Colors.blue,
                    primaryColorDark: Colors.blue,
                  ),
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
              ),
              SizedBox(
                  height: 10.0,
                  width: 50.0,
                  child: Divider(
                    color: Colors.white,
                  )),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                TextButton(
                  child: Text(
                    "Forgot password",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    Get.to(ResetScreen()) ; 
                  },
                ),
              ]),
              SizedBox(
                  height: 15.0,
                  width: 50.0,
                  child: Divider(
                    color: Colors.white,
                  )),
              Padding(
                padding: const EdgeInsets.only(
                    left: 0, right: 0, top: 0, bottom: 10),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    // height: 50,
                    // width: 210,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: FlatButton(
                      onPressed: () async {
                        var result = await context
                            .read<AuthenticationProvider>()
                            .logIn(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim());
                        if (result == 1) {
        
                            Get.to(ListCategories());
                          }
                          // Get.to(ListCategories());
                          
                        else
                          print("Create new account");
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Do not have an account?",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  TextButton(
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      Get.to(Sign_up());
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
