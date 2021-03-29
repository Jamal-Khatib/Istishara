import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_app/pages/user_controller.dart';




class AllQuestions extends StatelessWidget {

  UserController controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
     var c =  controller.myUser.value ; 
    return Scaffold(

      appBar: AppBar(title: Text("My Questions"),),
      body: ListView(

        children: [

           c.architect==""? Container() : Card( elevation: 10,child: Column(children: [ Text("Architect", style: TextStyle(color: Colors.white,backgroundColor: Colors.blue,fontSize: 20),), SizedBox(height: 20,),Text("${c.architect}",)]),),
           c.civil==""? Container() : Card( elevation: 10,child: Column(children: [ Text("Civil Engineer", style: TextStyle(color: Colors.white,backgroundColor: Colors.blue,fontSize: 20),), SizedBox(height: 20,),Text("${c.civil}")]),),
           c.construction==""? Container() : Card( elevation: 10,child: Column(children: [ Text("Construction Engineer", style: TextStyle(color: Colors.white,backgroundColor: Colors.blue,fontSize: 20),), SizedBox(height: 20,),Text("${c.construction}")]),),
           c.electrical==""? Container() : Card( elevation: 10,child: Column(children: [ Text("Electrical Engineer", style: TextStyle(color: Colors.white,backgroundColor: Colors.blue,fontSize: 20),), SizedBox(height: 20,),Text("${c.electrical}")]),),
           c.family==""? Container() : Card( elevation: 10,child: Column(children: [ Text("Family practitioner", style: TextStyle(color: Colors.white,backgroundColor: Colors.blue,fontSize: 20),), SizedBox(height: 20,),Text("${c.family}")]),),
           c.heating==""? Container() : Card( elevation: 10,child: Column(children: [ Text("Heating & cooling Engineer", style: TextStyle(color: Colors.white,backgroundColor: Colors.blue,fontSize: 20),), SizedBox(height: 20,),Text("${c.heating}")]),),
           c.mechanical==""? Container() : Card( elevation: 10,child: Column(children: [ Text("Mechanical Enginner", style: TextStyle(color: Colors.white,backgroundColor: Colors.blue,fontSize: 20),), SizedBox(height: 20,),Text("${c.mechanical}")]),),
           c.psych==""? Container() : Card( elevation: 10,child: Column(children: [ Text("Psychologist", style: TextStyle(color: Colors.white,backgroundColor: Colors.blue,fontSize: 20),), SizedBox(height: 20,),Text("${c.psych}")]),),
          c.doctor==""? Container() : Card( elevation: 10,child: Column(children: [ Text("Doctor", style: TextStyle(color: Colors.white,backgroundColor: Colors.blue,fontSize: 20),), SizedBox(height: 20,),Text("${c.doctor}")]),),

        ],
        
      ),
    );
  }
}