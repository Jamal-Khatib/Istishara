import 'package:firebase_app/authenticationProvider.dart';
import 'package:firebase_app/list_of_categories.dart';
import 'package:firebase_app/log_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Sign_up extends StatefulWidget {
  @override
  _Sign_upState createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool valuefirst = false;
  String dropdownValue = 'Doctor';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      // resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Create a new account"),
      ),
      body: ListView(
        children: [
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Full Name",
                labelText: "Full Name",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email",
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Password",
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Phone Number",
                labelText: "Phone Number",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(width: 60),
              Text(
                "Expert",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.blue,
                  value: this.valuefirst,
                  onChanged: (bool value) {
                    setState(() {
                      this.valuefirst = value;
                    });
                  }),
              Container(
                child: !valuefirst
                    ? Container(
                        width: 0,
                      )
                    : DropdownButton<String>(
                        hint: Text("Field"),
                        value: dropdownValue,
                        // icon: Icon(Icons.check_box_outline_blank_sharp, color: Colors.blue,),
                        iconSize: 50,
                        elevation: 30,
                        style: TextStyle(color: Colors.black, fontSize: 15),
                        underline: Container(
                          height: 2,
                          color: Colors.black,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: <String>[
                          'Doctor',
                          'Electrical Engineer',
                          'Civil Engineer',
                          'Construction Engineer',
                          'Architect',
                          'Psychologist',
                          'Mechanical Enginner',
                          'Heating & cooling Engineer',
                          'Family practitioner'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            child: FlatButton(
              onPressed: () async {
                var result = await context
                    .read<AuthenticationProvider>()
                    .signUp(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim());
                if (result == 1) {
                  Get.to(ListCategories());
                } else {
                  print("Can't create new account");
                }
              },
              child: Text(
                'Sign Up',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
