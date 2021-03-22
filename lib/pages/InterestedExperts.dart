import 'package:firebase_app/pages/list_of_categories.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/pages/user_controller.dart';
import 'package:get/get.dart';

class InterestedExperts extends StatelessWidget {
    UserController controller = Get.put(UserController());


  Widget build(BuildContext context) {
    controller.getUser() ; 
    return Scaffold(
      appBar: AppBar(title: Text("mwaffa2 jamal")),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Card(
              //color:Colors.blue,
              elevation: 15.0,
              shadowColor: Colors.blue,
              margin: EdgeInsets.symmetric(vertical: 35.0, horizontal: 30.0),
              child: ListTile(
                trailing: IconButton(
                    icon: const Icon(Icons.delete,),
                    color: Colors.black,
                    onPressed: () {
                      controller.delete_question(category: Get.arguments)  ; 
                      Get.off(ListCategories()) ; 
                    }),
                title: Obx( () => 
                Text(
                  
                  "${controller.get_question(category: Get.arguments)}",
                  // "${Get.arguments}",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
                ),
              ),
            ),
            SizedBox(
              height: 0.0,
              width: 150.0,
              /*child: Divider(
                  //color: Colors.teal.shade100,
                ),*/
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              Text(
                '\n    Interested Experts\n',
                style: TextStyle(
                  //color: Colors.teal.shade100,
                  fontSize: 20.0,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
            //Divider(color: Colors.black, endIndent: 170.0),
            ListTile(
              title: TextButton(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 120.0),
                    child: Text(
                      "Name of expert",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  onPressed: () {}),
              leading: Icon(Icons.account_circle_rounded, color: Colors.black),
              trailing: TextButton(
                  child: Text('Pick me!'),
                  style: TextButton.styleFrom(
                      primary: Colors.blue,
                      textStyle: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold)),
                  onPressed: () {}),
              enabled: true,
            ),
            Divider(color: Colors.black),
           
            Divider(color: Colors.black, thickness: 1.0),
          ],
        ),
      ),
    );
  }
}
