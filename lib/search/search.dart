import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  TextEditingController searchcontroller = TextEditingController() ; 



  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search"),),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: searchcontroller,
              decoration: InputDecoration(
              prefixIcon: Icon(Icons.search)
            ),
            )
            
          ],
        ),
      ),
    );
  }
}