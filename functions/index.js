const functions = require("firebase-functions");

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

const admin = require("firebase-admin");
admin.initializeApp();
// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//

//  const db=admin.firestore();

//  exports.helloWorld = functions.https.onRequest((request, response) => {
//  functions.logger.info("Hello logs!", {structuredData: true});
//  response.send("Hello from Firebase!");
//  });

//  exports.functiontry = functions.firestore.
//    document("Jamal Al-Khatib_Doctor Siko/{type}")
//    .onCreate((snapshot, context) => {
//      const querySnapshot = db.collection("tokens").get();
//
//      querySnapshot.forEach((tokenDoc) => {
//        console.log(tokenDoc.data().token);
//      });
//    });

//  exports.myFunction = functions.firestore
//    .document("Jamal Al-Khatib_Doctor Siko/{type}")
//    .onCreate((snapshot, context) => {
//      console.log("thissssssssssss" + snapshot.data());
//    });

//  exports.myFunctionnn = functions.firestore
//    .document("Jamal Al-Khatib_Doctor Siko/{type}")
//    .onCreate((snapshot, context) => {
//      return admin.messaging().sendToTopic("Jamal Al-Khatib_Doctor Siko", {
//        notification: {
//          title: snapshot.data().type,
//          body: snapshot.data().text,
//          click_action: "FLUTTER_NOTIFICATION_CLICK",
//        },
//      });
//    });


//  exports.myFunctionnn = functions.firestore
//    .document("Jamal Al-Khatib_Doctor Siko/{type}")
//    .onCreate((snapshot, context) => {
//      return admin.messaging().sendToDevice("fQyiawLeQ4WZRqFi7_l1"+
//                        "YV:APA91bFJwSwR9tE" +
//                     "xrljsW_KWJ48sDruwTLnPL2nWPMrEee7KKBg6psk0CI3BD"+
//                      "XQcrnM4JhJQlGwivWIp6ec6yoI3tpoP_jTPocwZhVIJffWO7Rd"+
//                      "pzHhqZPE1RI4JoKVbNnx9sUg8xWxL", {
//        notification: {
//          title: snapshot.data().type,
//          body: snapshot.data().text,
//          click_action: "FLUTTER_NOTIFICATION_CLICK",
//        },
//      });
//    });
//
const db=admin.firestore();
exports.myFunctionNew = functions.firestore
    .document("Jamal_Doctor Malaz/{type}")
    .onCreate((snapshot, context) => {
      // const querySnapshot= admin.firestore().collection("tokens").get();
      const tokens=[];
      for (const tokenDoc of db.collection("tokens").get()) {
        tokens.push(tokenDoc.data().token);
      }
      return admin.messaging().sendToDevice(tokens, {
        notification: {
          title: snapshot.data().type,
          body: snapshot.data().text,
          click_action: "FLUTTER_NOTIFICATION_CLICK",
        },
      });
    });

// exports.TokenFunction = functions.firestore
//    .document("users/{chatPeople}")
//    .onCreate((snapshot, context)=>{
//      return admin.messaging().sendToDevice("fQyiawLeQ4WZRqFi7_l1"+
//                        "YV:APA91bFJwSwR9tE" +
//                         "xrljsW_KWJ48sDruwTLnPL2nWPMrEee7KKBg6psk0CI3BD"+
//                         "XQcrnM4JhJQlGwivWIp6ec6yoI3tpoP_jTPocwZhVIJffWO7Rd"+
//                          "pzHhqZPE1RI4JoKVbNnx9sUg8xWxL", {
//        notification: {
//          title: "New Meeting request",
//          body: "click for details",
//          clickAction: "FLUTTER_NOTIFICATION_CLICK",
//        },
//      });
//    });
//
// exports.TokenChatFunction = functions.firestore
//    .document("Jamal Al-Khatib_Doctor Siko/{uid}")
//    .onCreate((snapshot, context)=>{
//      return admin.messaging().sendToDevice(snapshot.data().token, {
//        notification: {
//          title: "New Meeting request",
//          body: "click for details",
//          clickAction: "FLUTTER_NOTIFICATION_CLICK",
//        },
//      });
//    });

// exports.rejectFunction = functions.firestore
//    .document("Appt/{uid}")
//    .onDelete((snapshot, context)=>{
//      return admin
//          .messaging()
//          .sendToDevice(snapshot.data().token, {
//            notification: {
//              title: "Your meeting request has been denied",
//              clickAction: "FLUTTER_NOTIFICATION_CLICK",
//            },
//          });
//    });

//  exports.acceptFunction = functions.firestore
//    .document("Appt/{uid}")
//    .onUpdate((change, context)=>{
//      return admin
//          .messaging()
//          .sendToDevice( change.after.data().SecToken, {
//            notification: {
//              title: "Your meeting request has been accepted",
//              body: "Check your calendar",
//              clickAction: "FLUTTER_NOTIFICATION_CLICK",
//            },
//          });
//    });


// exports.TokenFunctionforPick = functions.firestore
//    .document("users.FtNBmpSFOgPPlxvu6qKFcAj2jri1/{chatPeople}")
//    .onWrite((snapshot, context)=>{
//      return admin.messaging().sendToDevice("fQyiawLeQ4WZRqFi7_l1"+
//                "YV:APA91bFJwSwR9tE" +
//                 "xrljsW_KWJ48sDruwTLnPL2nWPMrEee7KKBg6psk0CI3BD"+
//                 "XQcrnM4JhJQlGwivWIp6ec6yoI3tpoP_jTPocwZhVIJffWO7Rd"+
//                  "pzHhqZPE1RI4JoKVbNnx9sUg8xWxL", {
//        notification: {
//          title: "New Client",
//          body: "click for details",
//          clickAction: "FLUTTER_NOTIFICATION_CLICK",
//        },
//      });
//    });
