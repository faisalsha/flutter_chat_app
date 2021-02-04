import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Messagebubble extends StatelessWidget {
  final Key key;
  final String message;
  final String userName;
  final bool isMe;

  Messagebubble(this.message, this.userName, this.isMe, {this.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          width: 140.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
                bottomLeft:
                    !isMe ? Radius.circular(0.0) : Radius.circular(12.0),
                bottomRight:
                    !isMe ? Radius.circular(0.0) : Radius.circular(12.0),
              ),
              color: isMe ? Colors.grey[300] : Theme.of(context).primaryColor),
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isMe
                        ? Colors.black
                        : Theme.of(context).accentTextTheme.title.color),
              ),
              Text(
                message,
                style: TextStyle(
                    color: isMe
                        ? Colors.black
                        : Theme.of(context).accentTextTheme.title.color),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
