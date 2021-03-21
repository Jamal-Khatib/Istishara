import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/SearchingExpert.dart';
import 'InterestedExperts.dart';
import 'backgroundExperts.dart';

class PostingQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Asking a Question",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: TextField(
                maxLines: 7,
                decoration: InputDecoration(
                  labelText: "Post Your Question",
                  labelStyle: TextStyle(
                    fontSize: 25,
                  ),
                  hintText: "Enter Your Question Here",
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black38,
                  ),
                  fillColor: Colors.grey[300],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 10),
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                height: 45,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () {
                    Get.to(InterestedExperts());
                  },
                  child: Text(
                    'Post Your Question',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Want To Ask A Specific Expert?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.to(SearchingExpert());
                  },
                  child: Text(
                    "Click Here!",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
