import 'package:firebase_app/pages/InterestedExperts.dart';
import 'package:firebase_app/pages/PostingQuestion.dart';
import 'package:firebase_app/pages/ask_question.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_app/pages/user_controller.dart';
import 'package:get/get.dart';

class CategoriesListBuild extends StatelessWidget {
  final List<String> categoriesList;
  final List<String> categoriesListIconss;
    UserController controller = Get.put(UserController());


  CategoriesListBuild(this.categoriesList, this.categoriesListIconss);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        // Container(height: 20, child: Image.asset('assets/images/icons/doctor.png', fit: BoxFit.cover,)),
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          elevation: 8,
          color: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    height: 30,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: Image.asset(
                          categoriesListIconss[index],
                          fit: BoxFit.cover,
                        ))),
                TextButton(
                  onPressed: () {
                    if(categoriesList[index]=="Architect") 
                    {
                      if(controller.myUser.value.architect=="") 
                      {
                        Get.to(AskQuestion(),arguments: "architect");

                      }
                      else{
                        Get.to(InterestedExperts(),arguments: "architect");
                      }
                    }
                    else if(categoriesList[index]=="Civil Engineer") 
                    {
                      if(controller.myUser.value.civil=="") 
                      {
                        Get.to(AskQuestion(),arguments: "civil");

                      }
                      else{
                        Get.to(InterestedExperts(),arguments: "civil");
                      }
                    }
                    else if(categoriesList[index]=="Construction Engineer") 
                    {
                      if(controller.myUser.value.construction=="") 
                      {
                        Get.to(AskQuestion(),arguments: "construction");

                      }
                      else{
                        Get.to(InterestedExperts(),arguments: "construction");
                      }
                    }
                    else if(categoriesList[index]=="Doctor") 
                    {
                      if(controller.myUser.value.doctor=="") 
                      {
                        Get.to(AskQuestion(),arguments: "doctor");

                      }
                      else{
                        Get.to(InterestedExperts(),arguments: "doctor");
                      }
                    }
                    else if(categoriesList[index]=="Electrical Engineer") 
                    {
                      if(controller.myUser.value.electrical=="") 
                      {
                        Get.to(AskQuestion(),arguments: "electrical");

                      }
                      else{
                        Get.to(InterestedExperts(),arguments: "electrical");
                      }
                    }
                    else if(categoriesList[index]=="Family practitioner") 
                    {
                      if(controller.myUser.value.family=="") 
                      {
                        Get.to(AskQuestion(),arguments: "family");

                      }
                      else{
                        Get.to(InterestedExperts(),arguments: "family");
                      }
                    }
                    else if(categoriesList[index]=="Heating & cooling Engineer") 
                    {
                      if(controller.myUser.value.heating=="") 
                      {
                        Get.to(AskQuestion(),arguments: "heating");

                      }
                      else{
                        Get.to(InterestedExperts(),arguments: "heating");
                      }
                    }
                    else if(categoriesList[index]=="Mechanical Enginner") 
                    {
                      if(controller.myUser.value.mechanical=="") 
                      {
                        Get.to(AskQuestion(),arguments: "mechanical");

                      }
                      else{
                        Get.to(InterestedExperts(),arguments: "mechanical");
                      }
                    }
                    else if(categoriesList[index]=="Psychologist") 
                    {
                      if(controller.myUser.value.psych=="") 
                      {
                        Get.to(AskQuestion(),arguments: "psych");

                      }
                      else{
                        Get.to(InterestedExperts(),arguments: "psych");
                      }
                    }
                    
                  },
                  child: Text(
                    categoriesList[index],
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: categoriesList.length,
    );
    // children: transactions.map((tx) {}).toList(),    replace tx with transactions[index]
  }
}
