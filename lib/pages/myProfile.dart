import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'profile.dart';

class myProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                child: Text(
                  "MY NAME",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Get.to(Profile());
                },
              ),
            ),
          ),
          SizedBox(height: 5),
          Center(
            child: Container(
              child: Text(
                "thisismyemail@gmail.com",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue[200],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              height: 20,
              color: Colors.black26,
            ),
          ),
          SizedBox(height: 20),
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
                        Icons.description,
                        color: Colors.blue,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Privacy Policy",
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
                child: Row(children: <Widget>[
                  SizedBox(
                    width: 7,
                  ),
                  Icon(
                    Icons.content_paste,
                    color: Colors.blue,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Terms and Conditions",
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
