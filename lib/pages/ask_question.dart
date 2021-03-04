
import 'package:firebase_app/pages/list_of_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AskQuestion extends StatefulWidget {
  @override
  _AskQuestionState createState() => _AskQuestionState();
}

class _AskQuestionState extends State<AskQuestion> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
                child: Text('Click me',style: TextStyle(color: Colors.white),),
                onPressed: () {
                  Get.to(ListCategories()) ; 
                },
              ),
    );
  }
}

