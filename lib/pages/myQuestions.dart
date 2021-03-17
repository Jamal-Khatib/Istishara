import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'ask_question.dart';

class myQuestions extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              Image.asset(
                "assets/images/noMessage.png",
                fit: BoxFit.cover,
                height: 300,
                width: 300,
              ),
              Text(
                'Welcome to your messages',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '\n',
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              Text(
                "Looks like you don't have any messages.",
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              Text(
                'Get connected.',
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    '                             ',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  TextButton(
                    child: Text(
                      'Browse',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {},
                  ),
                  Text(
                    'or',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  TextButton(
                    child: Text(
                      'post a question',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                     Get.to(AskQuestion());
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
