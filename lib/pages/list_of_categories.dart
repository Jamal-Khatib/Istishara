import 'package:firebase_app/pages/user_controller.dart';
import 'categories_build.dart';
import 'package:firebase_app/pages/log_in.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/authenticationProvider.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'navigationClient.dart';

// import 'myProfile.dart';

final List<String> categoriesList = [
  "Architect",
  "Civil Engineer",
  "Construction Engineer",
  "Doctor",
  "Electrical Engineer",
  "Family practitioner",
  "Heating & cooling Engineer",
  "Mechanical Enginner",
  "Psychologist",
];

final List<String> categoriesListIcons = [
  "assets/images/icons/architect.png",
  "assets/images/icons/civil.png",
  "assets/images/icons/construction.png",
  "assets/images/icons/doctor.png",
  "assets/images/icons/electrical.png",
  "assets/images/icons/family.png",
  "assets/images/icons/heating.png",
  "assets/images/icons/mechanical.png",
  "assets/images/icons/psychologist.png",
];

class ListCategories extends StatefulWidget {
  @override
  _ListCategoriesState createState() => _ListCategoriesState();
}

class _ListCategoriesState extends State<ListCategories> {
  UserController controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    controller.getUser();
    final appBar = AppBar(
      // leading: Container(height: 0, width: 0,),
      title:  Text("Choose a Category",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
      backgroundColor: Colors.blue[600],
      actions: [
        RaisedButton.icon(
            color: Colors.blue[600],
            icon: Icon(Icons.login),
            onPressed: () {
              context.read<AuthenticationProvider>().signOut();
              Get.off(Login());
            },
            label: Text(
              "Log out",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 15,
              ),
            )),
      ],
    );

    final txListWidget = Container(
        height: (MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.bottom -
                MediaQuery.of(context).padding.top
                
            // - navigationClient.Scaffold.of(context).
            - (MediaQuery.of(context).size.height)*0.1
            ) 
            ,
        child: CategoriesListBuild(categoriesList, categoriesListIcons));

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Center(
            //   child: Container(
            //     padding: EdgeInsets.all(4),
            //   ),
            // ),
            txListWidget,
            // Container(
            //   padding: EdgeInsets.all(9),
            // )
          ],
        ),
      ),
    );
  }
}