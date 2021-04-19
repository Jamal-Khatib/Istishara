import 'package:firebase_app/pages/user_controller.dart';

import 'editProfile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:rating_dialog/rating_dialog.dart';
import 'package:rating_bar/rating_bar.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

    UserController controller = Get.put(UserController());

  
  @override
  Widget build(BuildContext context) {


    List<double> rate = [5, 4.5, 5.0, 3.5];
    
    var mean = rate.reduce((a, b) => a + b) / rate.length;

    
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 18.0, bottom: 18, left: 15, right: 28),
                child: CircleAvatar(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 85, left: 100),
                    child: IconButton(
                      //highlightColor: Colors.grey,
                      color: Colors.grey[600],
                      //focusColor: Colors.grey[600],
                      icon: Icon(
                        Icons.mode_edit,
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  radius: 70,
                  backgroundImage: NetworkImage(controller.myUser.value.imageURL),
                  backgroundColor: Colors.blue,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.44,
                height: MediaQuery.of(context).size.height*0.07,
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(8)),
                child: FlatButton(
                  onPressed: () {},
                  child: TextButton(
                    onPressed: () async {
                      await Get.to(
                        editProfile() 
                        
                      );
                    },
                    child: Text(
                      'EDIT PROFILE',
                      // textAlign: TextAlign.start,
                      style: TextStyle( color: Colors.white,  fontSize: MediaQuery.of(context).size.height*0.02),
                    ),
                  ),
                ),
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, bottom: 18.0),
                  child: Text(
                   controller.myUser.value.name,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                  ),
                ),
              ],
            ),
          
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Rating: ",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                  ),
                  RatingBar.readOnly(
                    filledColor: Colors.yellow[700],
                    emptyColor: Colors.yellow[700],
                    halfFilledColor: Colors.yellow[700],
                    initialRating: mean,
                    isHalfAllowed: true,
                    halfFilledIcon: Icons.star_half,
                    filledIcon: Icons.star,
                    emptyIcon: Icons.star_border,
                  ),
                ],
              ),
            ),

           

            Padding(
              padding: const EdgeInsets.only(left: 18.0, bottom: 12.0, top: 18),
              child: Text(
                'About',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 23),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 18.0, bottom: 12.0),
              child: Text(
                controller.myUser.value.about,
                // "h",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 4, left: 18.0, bottom: 0.0),
              child: Text(
                'My skills',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 23),
              ),
            ),
            controller.myUser.value.skill1==""? Container() : Text(controller.myUser.value.skill1,style: TextStyle(fontWeight: FontWeight.bold)),
            controller.myUser.value.skill2==""? Container() : Text(controller.myUser.value.skill2,style: TextStyle(fontWeight: FontWeight.bold)),
            controller.myUser.value.skill3==""? Container() : Text(controller.myUser.value.skill3,style: TextStyle(fontWeight: FontWeight.bold)),
            controller.myUser.value.skill4==""? Container() : Text(controller.myUser.value.skill4,style: TextStyle(fontWeight: FontWeight.bold)),
            controller.myUser.value.skill5==""? Container() : Text(controller.myUser.value.skill5,style: TextStyle(fontWeight: FontWeight.bold)),
            controller.myUser.value.skill6==""? Container() : Text(controller.myUser.value.skill6,style: TextStyle(fontWeight: FontWeight.bold),)





      

          ],
        ),
      ),
    );
  }
}
