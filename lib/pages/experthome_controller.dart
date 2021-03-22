import 'package:get/get.dart';



class PickController extends GetxController
{
  var s = "Pick".obs ; 

  

  void change()
  {
    if(s.value=="Pick") 
    {
      s.value = "Cancel" ; 
      

    }
    else 
    {
      s.value = "Pick" ; 
    }
  }

}