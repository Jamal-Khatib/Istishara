import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/pages/list_of_categories.dart';
import 'package:firebase_app/pages/navigationClient.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/pages/user_controller.dart';
import 'package:get/get.dart';

class InterestedExperts extends StatefulWidget {
  @override
  _InterestedExpertsState createState() => _InterestedExpertsState();
}

class _InterestedExpertsState extends State<InterestedExperts> {

  
    UserController controller = Get.put(UserController());

  Widget build(BuildContext context) {


      

    controller.getUser() ; 




    int x = controller.get_list(Get.arguments).length ; 



    return Scaffold(
      appBar: AppBar(title: Text("My Questions")),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Card(                 
              elevation: 5.0,
              shadowColor: Colors.blue,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
              child: ListTile(
                trailing: IconButton(
                    icon: const Icon(Icons.delete,),
                    color: Colors.red,
                    onPressed: () {
                      controller.delete_question(category: Get.arguments)  ; 
                      Get.off(navigationClient()) ; 
                    }),
                title:  
                Text(
                  
                  "${controller.get_question(category: Get.arguments)}",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    
                  ),
                ),
                
              ),
            ),
            SizedBox(
              height: 0.0,
              width: 150.0,
             
            ),
            Text(
              '\n    Interested Experts\n',
              style: TextStyle(
                fontSize: 20.0,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),



            StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance.collection("users").doc(controller.myUser.value.uid).snapshots(),
              builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) { 

                print("wathc meeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee") ; 
                  print(snapshot.data["name"]) ; 
                String field = Get.arguments ; 
                String field2 = field[0].toUpperCase() + field.substring(1) ; 
                List experts  = snapshot.data["interested$field2"] ; 
                print(experts) ; 
                    return  ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: experts.length,
                      itemBuilder: (BuildContext context, int index) 
                      {
                        print("Paulaaaaaaaaaaaaaaaaaaaaaaaaaa") ; 

                        if(experts.length==0) return(Container()) ; 
                        return Card(
                          child: ListTile(
                            leading: Icon(Icons.person),
                            title: TextButton(child: Text(experts[index]),onPressed: () {},),
                            trailing: TextButton(child: Text("Pick me"), onPressed: ()  {},               ),
                          ),
                        ); 
                      },

                      ); 
              }
                
            ),





            // ListView.builder(       
            // shrinkWrap: true,
            // physics: ClampingScrollPhysics(),
            //   itemCount: x,
            //   itemBuilder: (BuildContext context, int index)  
            //   {
            //     return(  Card( 
            //       child: ListTile(
            //         leading: Icon(Icons.person),                             //s2
            //         title: TextButton(child: Text("${controller.get_list(Get.arguments)[index]}"), onPressed: ()  {},               ),
            //         trailing: TextButton(child: Text("Pick me"), onPressed: ()  {},               ),
            //       )
            //       ,
            //     )   ); 
            //   },        
            // )  ,

          
          ],
        ),
      ),
    );
  }
}



