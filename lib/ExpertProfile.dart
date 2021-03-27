import 'package:firebase_app/pages/Profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_app/pages/user_controller.dart';

class ExpertProfile extends StatelessWidget {
  UserController controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    var count = 100.obs;
    // controller.getUser();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(
            "My Profile",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20),
          Center(
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
              backgroundImage: NetworkImage(
                  "https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png"),
              backgroundColor: Colors.blue,
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Container(
              child: TextButton(
                child: Obx(
                  () => Text(
                    "${controller.myUser.value.name}",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                onPressed: () {
                  Get.to(Profile());
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 5, 10, 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  //color: Colors.yellow[100],
                  border: Border.all(
                    color: Colors.grey[400],
                    // style: border_style_rounded,
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        " My Balance:  ",
                        style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Obx(
                        () => Text(
                          "$count \$",
                          style: TextStyle(
                            fontSize: 23,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          // Center(
          //   child: Container(
          //     child: Obx( () =>
          //     Text(
          //       "${controller.myUser.value.email}",
          //       style: TextStyle(
          //         fontSize: 20,
          //         color: Colors.blue[200],
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //      ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: Colors.black26,
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: StadiumBorder(
                //Card with stadium border
                side: BorderSide(
                  color: Colors.blue,
                  width: 2.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    //Padding: EdgeInsets.all(value)
                    //mainAxisAlignment: MainAxisAlignment.,

                    children: <Widget>[
                      SizedBox(
                        width: 7,
                      ),
                      Icon(
                        Icons.notifications,
                        color: Colors.blue,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Notifications",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: StadiumBorder(
                //Card with stadium border
                side: BorderSide(
                  color: Colors.blue,
                  width: 2.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    //Padding: EdgeInsets.all(value)
                    //mainAxisAlignment: MainAxisAlignment.,

                    children: <Widget>[
                      SizedBox(
                        width: 7,
                      ),
                      Icon(
                        Icons.settings,
                        color: Colors.blue,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Notification Settings",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: StadiumBorder(
                //Card with stadium border
                side: BorderSide(
                  color: Colors.blue,
                  width: 2.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    //Padding: EdgeInsets.all(value)
                    //mainAxisAlignment: MainAxisAlignment.,

                    children: <Widget>[
                      SizedBox(
                        width: 7,
                      ),
                      Icon(
                        Icons.assignment,
                        color: Colors.blue,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Password and Security",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: StadiumBorder(
                //Card with stadium border
                side: BorderSide(
                  color: Colors.blue,
                  width: 2.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    //Padding: EdgeInsets.all(value)
                    //mainAxisAlignment: MainAxisAlignment.,

                    children: <Widget>[
                      SizedBox(
                        width: 7,
                      ),
                      Icon(
                        Icons.info,
                        color: Colors.blue,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "About App",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: StadiumBorder(
                //Card with stadium border
                side: BorderSide(
                  color: Colors.blue,
                  width: 2.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  //Padding: EdgeInsets.all(value)
                  //mainAxisAlignment: MainAxisAlignment.,

                  children: <Widget>[
                    SizedBox(
                      width: 7,
                    ),
                    Icon(
                      Icons.contact_phone,
                      color: Colors.blue,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Contact Us",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
