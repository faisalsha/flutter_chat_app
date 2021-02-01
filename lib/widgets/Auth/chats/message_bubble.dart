import 'package:flutter/material.dart';

class Messagebubble extends StatelessWidget {
  final String message;
  final bool isMe;
  final Key key;
  Messagebubble(this.message, this.isMe, {this.key});
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
          child: Text(
            message,
            style: TextStyle(
                color: isMe
                    ? Colors.black
                    : Theme.of(context).accentTextTheme.title.color),
          ),
        ),
      ],
    );
  }
}
