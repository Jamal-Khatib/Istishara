import 'package:flutter/material.dart';

class Experthome extends StatelessWidget {
  List questions = myquestionlst();
  List dates = datelst();
  List bides = bidelst();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Questions"),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                //increment the counter + icon becomes blue
              },
            ),
          ],
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text(questions[1] + "\n" + "\n"),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Container(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            /*Row(
                            children: <Widget>[
                              Icon(Icons.access_time),
                              Text("   "+dates[2]),
                            ]
                        ),*/
                            /*Container(
                          margin: const EdgeInsets.only(top:5.0),
                        ),*/
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: const Icon(Icons.person_add_alt_1),
                                  onPressed: () {},
                                ),
                                Text(bides[2]),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                enabled: true,
              ),
              Divider(color: Colors.black),
              ListTile(
                title: Text(questions[1] + "\n" + "\n"),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Container(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            /*Row(
                            children: <Widget>[
                              Icon(Icons.access_time),
                              Text("   "+dates[2]),
                            ]
                        ),
                        Container(
                          margin: const EdgeInsets.only(top:5.0),
                        ),*/
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: const Icon(Icons.person_add_alt_1),
                                  onPressed: () {},
                                ),
                                Text(bides[2]),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                enabled: true,
              ),
              Divider(color: Colors.black),
              ListTile(
                title: Text(questions[1] + "\n" + "\n"),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Container(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            /*Row(
                            children: <Widget>[
                              Icon(Icons.access_time),
                              Text("   "+dates[2]),
                            ]
                        ),*/
                            /*Container(
                          margin: const EdgeInsets.only(top:5.0),
                        ),*/
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: const Icon(Icons.person_add_alt_1),
                                  onPressed: () {},
                                ),
                                Text(bides[2]),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                enabled: true,
              ),
              Divider(color: Colors.black),
              ListTile(
                title: Text(questions[1] + "\n" + "\n"),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Container(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            /*Row(
                            children: <Widget>[
                              Icon(Icons.access_time),
                              Text("   "+dates[2]),
                            ]
                        ),
                        Container(
                          margin: const EdgeInsets.only(top:5.0),
                        ),*/
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: const Icon(Icons.person_add_alt_1),
                                  onPressed: () {},
                                ),
                                Text(bides[2]),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                enabled: true,
              ),
              Divider(color: Colors.black),
              ListTile(
                title: Text(questions[1] + "\n" + "\n"),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Container(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            /*Row(
                            children: <Widget>[
                              Icon(Icons.access_time),
                              Text("   "+dates[2]),
                            ]
                        ),
                        Container(
                          margin: const EdgeInsets.only(top:5.0),
                        ),*/
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: const Icon(Icons.person_add_alt_1),
                                  onPressed: () {},
                                ),
                                Text(bides[2]),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                enabled: true,
              ),
              Divider(color: Colors.black),
            ],
          ),
        ));
  }

  static List myquestionlst() {
    List list = List.generate(10, (i) {
      return "Question ${i + 1}";
    });
    return list;
  }

  static List datelst() {
    List list = List.generate(10, (i) {
      return "${i + 1} days ago";
    });
    return list;
  }

  static List bidelst() {
    List list = List.generate(10, (i) {
      return "${i + 1} bides";
    });
    return list;
  }
}
