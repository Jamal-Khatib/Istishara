import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_app/widgets/SkillsList.dart';
import 'profile.dart';

class editProfile extends StatefulWidget {
  @override
  _editProfileState createState() => _editProfileState();
}

void goto() {
  Get.to(Profile());
}

class _editProfileState extends State<editProfile> {
  final _controller = new TextEditingController(text: (Get.arguments).name);
  final _controller1 = new TextEditingController(text: (Get.arguments).about);
  final _controller2 = new TextEditingController(text: (Get.arguments).price);
  final _controller3 =
      new TextEditingController(text: (Get.arguments).skillslst[0]);
  final _controller4 =
      new TextEditingController(text: (Get.arguments).skillslst[1]);
  final _controller5 =
      new TextEditingController(text: (Get.arguments).skillslst[2]);
  final _controller6 =
      new TextEditingController(text: (Get.arguments).skillslst[3]);
  final _controller7 =
      new TextEditingController(text: (Get.arguments).skillslst[4]);
  final _controller8 =
      new TextEditingController(text: (Get.arguments).skillslst[5]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                    labelText: "Name",
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.blue,
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: _controller2,
                decoration: InputDecoration(
                    labelText: "Price Range Per Question",
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.blue,
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                maxLines: 5,
                controller: _controller1,
                decoration: InputDecoration(
                    labelText: "About",
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.blue,
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
              child: TextField(
                controller: _controller3,
                decoration: InputDecoration(
                    labelText: "Skill 1",
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.blue,
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: TextField(
                controller: _controller4,
                decoration: InputDecoration(
                    labelText: "Skill 2",
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.blue,
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: TextField(
                controller: _controller5,
                decoration: InputDecoration(
                    labelText: "Skill 3",
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.blue,
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: TextField(
                controller: _controller6,
                decoration: InputDecoration(
                    labelText: "Skill 4",
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.blue,
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: TextField(
                controller: _controller7,
                decoration: InputDecoration(
                    labelText: "Skill 5",
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.blue,
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: TextField(
                controller: _controller8,
                decoration: InputDecoration(
                    labelText: "Skill 6",
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.blue,
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(200, 10, 10, 40),
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    Get.arguments.name = _controller.text;
                    Get.arguments.price = _controller2.text;
                    Get.arguments.about = _controller1.text;
                    Get.arguments.skillslst[0] = _controller3.text;
                    Get.arguments.skillslst[1] = _controller4.text;
                    Get.arguments.skillslst[2] = _controller5.text;
                    Get.arguments.skillslst[3] = _controller6.text;
                    Get.arguments.skillslst[4] = _controller7.text;
                    Get.arguments.skillslst[5] = _controller8.text;
                  });
                  goto();
                },
                color: Colors.blue,
                child: Text(
                  "Save Changes",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
