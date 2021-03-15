import 'package:firebase_app/pages/log_in.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/authenticationProvider.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'list_of_categories.dart';

class navController extends GetxController {
  final _selectedIndex = 0.obs;
  get selectedIndex => this._selectedIndex.value;
  set selectedIndex(index) => this._selectedIndex.value = index;
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    final navController navcontrol = Get.put(navController());
    final List<Widget> bodyContent = [
      list_of_categories(),
      page1(),
      page(),
      //Text("pageee"),

      // put here all pages you need
    ];

    return GetMaterialApp(
        title: "Istishara",
        home: Scaffold(
          body: Obx(() => Center(
                child: bodyContent.elementAt(navcontrol.selectedIndex),
              )),
          bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "page",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "page1",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "page",
                ),
              ],
              currentIndex: navcontrol.selectedIndex,
              onTap: (index) => Get.to(navcontrol.selectedIndex = index),
              //onTap: (page1) => Get.to(page1),
            ),
          ),

          // home: Container(
          //   color: Colors.white,
          //   child: Center(
          //     child: TextButton(
          //       child: Text(
          //         "press",
          //         style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           color: Colors.blue,
          //           fontSize: 50,
          //         ),
        )
        // onPressed: () {
        //   Get.to(page());
        // },
        //
        );
  }
}
