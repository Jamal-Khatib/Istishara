import 'package:firebase_app/pages/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';


class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  TextEditingController searchcontroller = TextEditingController() ; 
  UserController controller = Get.put(UserController());

  
  String resultLoaded ; 
  List experts  = [] ; 

  List searchResults = [] ; 

  @override
  void initState() 
  {
    super.initState() ; 
    searchcontroller.addListener( searchChange) ; 
  }

  @override 
  void dispose() 
  {
    searchcontroller.removeListener( searchChange) ;
    searchcontroller.dispose() ; 
    super.dispose() ; 
  }

  @override void didChangeDependencies() {
      super.didChangeDependencies();
      resultLoaded =   getExperts().toString()     ; 
    }


  void searchChange() 
  {
    
    getsearchResult() ; 
    print(searchcontroller.text) ; 

  }

  void getsearchResult() 
  {
    var shownResult = [] ; 
    if(searchcontroller.text.isNotEmpty) 
    {
      //we have search command
      for(var expert in experts) 
      {
        var ex = expert.data() ; 
        String name = ex["name"].toLowerCase() ; 

        if(name.contains(searchcontroller.text.toLowerCase())) 
        {
          shownResult.add(expert) ; 
        }

      }
      
    }
    else
    {
      shownResult = experts ; 
    }
     setState(() {
          searchResults = shownResult ; 
        });
   
  }

  Future<String> getExperts() async 
  {
    var data  = await FirebaseFirestore.instance.collection("users").where("type", isEqualTo: "expert").get() ;
    print("Hmmmmmmmmmmmmmmm")  ; 
    setState(() {
          experts = data.docs ; 
        });
    getsearchResult() ; 
    return "complete"; 
   
  }

  String getField(String s) 
  {
    if(s=="architect") return "Architect" ; 
    else if(s=="civil") return "Civil Engineer";
    else if(s=="construction") return "Construction Engineer"  ; 
    else if(s=="doctor") return "Doctor"  ; 
    else if(s=="electrical") return "Electrical Engineer"  ; 
    else if(s=="family") return "Family practitioner"  ; 
     else if(s=="heating") return "Heating & cooling Engineer"  ; 
      else if(s=="mechanical") return "Mechanical Enginner"  ; 
       else if(s=="psych") return "Psychologist"  ; 
  }
  

  Widget buildCard(BuildContext context, DocumentSnapshot documentSnapshot) 
  {
    final x = documentSnapshot.data() ; 
    print(x["name"]) ; 
    String s = x["name"] ; 
    String s2 = getField(x["field"]) ; 
    // return(Card(child: Text("$s"),)) ; 
    return Row(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.width*0.12,
                    width: MediaQuery.of(context).size.width*0.14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        topLeft: Radius.circular(5),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage("https://cdn4.iconfinder.com/data/icons/instagram-ui-twotone/48/Paul-18-512.png")
                      )
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.width*0.2,
                    width: MediaQuery.of(context).size.width*0.5,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20,0,0,0),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextButton(
                            child: Text("$s",
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: AdaptiveTextSize()
                                  .getadaptiveTextSize(context, 20)),

                            ),
                            onPressed: (){

                            },
                          ),
                          // SizedBox(height: 30),
                          Text("$s2",style: TextStyle(fontWeight: FontWeight.bold,fontSize: AdaptiveTextSize()
                                  .getadaptiveTextSize(context, 17)),)

                         
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(width: 10),
                 ElevatedButton.icon(
                      // color: Colors.blue,
                      onPressed: () {
                        alreadypicked(s)?  
                               Fluttertoast.showToast(
                                      msg:
                                          "You have already picked this expert, Check the chat page", //yalla
                                      gravity: ToastGravity.CENTER,
                                      toastLength: Toast.LENGTH_LONG,
                                      fontSize: 15,
                                    ) :  pick(s) ; 
                      },
                      icon: Icon(Icons.chat,color: Colors.white,),
                      label: Text("Contact",style: TextStyle(color: Colors.white),)
                       ),
                
                ],
              ) ; 
            
  }

   bool alreadypicked(String name) 
  {
    List l = controller.myUser.value.chatPeople ; 
    for(int i = 0 ; i<controller.myUser.value.chatPeople.length ; i++) 
    {
      if(l[i]==name) return true ; 
    }
    return false ; 
  }

  void pick(String name) async
  {
    controller.myUser.value.chatPeople.add(name) ; 
    FirebaseFirestore.instance.collection("users").doc(controller.myUser.value.uid).update(
      {
        "chatPeople" : controller.myUser.value.chatPeople 
      }
    ); 
    var f  = await FirebaseFirestore.instance.collection("users").limit(1).where("name", isEqualTo: name).get();
    var f1 = f.docs.first.id ; 
    var expert = await FirebaseFirestore.instance.collection("users").doc(f1).get() ; 
    List l1 = expert.data()["chatPeople"] ; 
    l1.add(controller.myUser.value.name) ; 
    FirebaseFirestore.instance.collection("users").doc(f1).update(
      {
          "chatPeople" : l1 
      }
      ); 
      Fluttertoast.showToast(
                    msg:
          "You have picked this expert successfully, Check the chat page!", //yalla
          gravity: ToastGravity.CENTER,
         toastLength: Toast.LENGTH_LONG,
        fontSize: 15,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search for an expert"),),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: searchcontroller,
              decoration: InputDecoration(
              prefixIcon: Icon(Icons.search)
            ),
            ),
          Expanded(
            child:  ListView.separated(
              separatorBuilder: (context,index) => Divider(color: Colors.blue[900],),
              itemCount: searchResults.length,
              itemBuilder:  (BuildContext context, int index)  
              {
                return(buildCard(context, searchResults[index]) ) ; 
                
              }
              )
          ),
          ],
        ),
      ),
    );
  }
}


class AdaptiveTextSize {
  const AdaptiveTextSize();

  getadaptiveTextSize(BuildContext context, dynamic value) {
    // 720 is medium screen height
    return (value / 720) * MediaQuery.of(context).size.height;
  }
}