// import 'editProfile.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// //import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// // import 'package:rating_dialog/rating_dialog.dart';
// import 'package:firebase_app/widgets/SkillsList.dart';
// import 'package:rating_bar/rating_bar.dart';


// class ProfileClientView extends StatefulWidget {
//   @override
//   _ProfileClientViewState createState() => _ProfileClientViewState();
// }

// class _ProfileClientViewState extends State<ProfileClientView> {
  

//   @override
//   Widget build(BuildContext context) {
    
//     return Scaffold(
//       body: SafeArea(
//         child: ListView(
//           children: <Widget>[
//             Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.only(
//                     top: 18.0, bottom: 18, left: 18, right: 33),
//                 child: CircleAvatar(
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 85, left: 100),
//                     // child: IconButton(
//                     //   //highlightColor: Colors.grey,
//                     //   color: Colors.grey[600],
//                     //   //focusColor: Colors.grey[600],
//                     //   icon: Icon(
//                     //     Icons.mode_edit,
//                     //     size: 30,
//                     //   ),
//                     //   onPressed: () {},
//                     // ),
//                   ),
//                   radius: 70,
//                   backgroundImage: NetworkImage(
//                       "https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png"),
//                   backgroundColor: Colors.blue,
//                 ),
//               ),
//               // Container(
//               //   decoration: BoxDecoration(
//               //       color: Colors.blue, borderRadius: BorderRadius.circular(8)),
//               //   child: FlatButton(
//               //     onPressed: () {},
//               //     child: TextButton(
//               //       onPressed: () {
//               //         Get.to(
//               //           editProfile(),
//               //           arguments: m,
//               //         );
//               //       },
//               //       child: Text(
//               //         'EDIT PROFILE',
//               //         style: TextStyle(color: Colors.white, fontSize: 20),
//               //       ),
//               //     ),
//               //   ),
//               // ),
//             ]),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 18.0, bottom: 18.0),
//                   child: Text(
//                     m.name,
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 23),
//                   ),
//                 ),
//                 // RatingBar(ratingWidget: ratingWidget, onRatingUpdate: onRatingUpdate),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
//               child: Row(
//                 children: <Widget>[
//                   Text(
//                     "Rating: ",
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 23),
//                   ),
//                   RatingBar.readOnly(
//                     filledColor: Colors.yellow[700],
//                     emptyColor: Colors.yellow[700],
//                     halfFilledColor: Colors.yellow[700],
//                     initialRating: mean,
//                     isHalfAllowed: true,
//                     halfFilledIcon: Icons.star_half,
//                     filledIcon: Icons.star,
//                     emptyIcon: Icons.star_border,
//                   ),
//                 ],
//               ),
//             ),
//             // Padding(
//             //   padding: const EdgeInsets.only(left: 12.0),
//             //   child: RatingBar.builder(
//             //     initialRating: 4.5,
//             //     minRating: 0,
//             //     direction: Axis.horizontal,
//             //     allowHalfRating: true,
//             //     itemCount: 5,
//             //     itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
//             //     itemBuilder: (context, _) => Icon(
//             //       Icons.star,
//             //       color: Colors.amber,
//             //     ),
//             //     onRatingUpdate: (rating) {
//             //       print(rating);
//             //     },
//             //   ),
//             // ),
//             // Row(
//             //   children: [
//             //     Padding(
//             //       padding: const EdgeInsets.only(left: 19.0, top: 19),
//             //       child: Text(
//             //         "Price range per question:",
//             //         style: TextStyle(
//             //             color: Colors.black,
//             //             fontWeight: FontWeight.bold,
//             //             fontSize: 17),
//             //       ),
//             //     ),
//             //     Padding(
//             //       padding: const EdgeInsets.only(left: 6.0, top: 19),
//             //       child: Text(
//             //         m.price,
//             //         style: TextStyle(
//             //             color: Colors.black,
//             //             fontWeight: FontWeight.bold,
//             //             fontSize: 17),
//             //       ),
//             //     ),
//             //   ],
//             // ),
//             // Row(children: [
//             //   Padding(
//             //     padding: const EdgeInsets.only(left: 8.0, top: 12),
//             //     child: Container(
//             //       decoration: BoxDecoration(
//             //           color: Colors.blue,
//             //           borderRadius: BorderRadius.circular(4)),
//             //       child: FlatButton(
//             //           onPressed: () {},
//             //           child: Text(
//             //             'Profile',
//             //             textAlign: TextAlign.center,
//             //             style: TextStyle(
//             //                 color: Colors.black,
//             //                 fontWeight: FontWeight.bold,
//             //                 fontSize: 17),
//             //           )),
//             //     ),
//             //   ),
//             //   Padding(
//             //     padding: const EdgeInsets.only(top: 12, right: 8),
//             //     child: Container(
//             //       decoration: BoxDecoration(
//             //           color: Colors.white,
//             //           borderRadius: BorderRadius.circular(4)),
//             //       child: FlatButton(
//             //           onPressed: () {},
//             //           child: Text(
//             //             'Previous Answered Questions',
//             //             style: TextStyle(
//             //                 color: Colors.black,
//             //                 fontWeight: FontWeight.bold,
//             //                 fontSize: 15),
//             //           )),
//             //     ),
//             //   ),
//             // ]),

//             Padding(
//               padding: const EdgeInsets.only(left: 18.0, bottom: 12.0, top: 18),
//               child: Text(
//                 'About',
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 23),
//               ),
//             ),

//             Padding(
//               padding: const EdgeInsets.only(left: 18.0, bottom: 12.0),
//               child: Text(
//                 m.about,
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.w600,
//                     fontSize: 16),
//               ),
//             ),

//             Padding(
//               padding: const EdgeInsets.only(top: 4, left: 18.0, bottom: 0.0),
//               child: Text(
//                 'My skills',
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 23),
//               ),
//             ),

//             skillsListWidget,
//             // ListTile(
//             //       title: Text("Become a Pro member"),)

//             // ListView(
//             //       physics: BouncingScrollPhysics(),
//             //       children: [
//             //         SkillsList(skillslst)],
//             //       )
//           ],
//         ),
//       ),
//     );
//   }
// }
