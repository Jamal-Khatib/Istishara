import 'package:flutter/material.dart';



class MessageBubble extends StatelessWidget {


  String message;
  bool isMe ; 

  MessageBubble(this.message,this.isMe) ; 


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [ Container(
        decoration: BoxDecoration(
          color: isMe? Colors.grey[300] : Colors.blue,
          borderRadius: BorderRadius.circular(12),
        ),
        width: 140,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Text(message, style: TextStyle(color: Colors.black),),
      ), 
      ] 
    ) ;
  }
}