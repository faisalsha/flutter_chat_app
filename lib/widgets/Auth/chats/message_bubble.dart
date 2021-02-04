import 'package:flutter/material.dart';

class Messagebubble extends StatelessWidget {
  final Key key;
  final String message;
  final String userName;
  final String userImage;
  final bool isMe;

  Messagebubble(this.message, this.userName, this.userImage, this.isMe,
      {this.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
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
                  color:
                      isMe ? Colors.grey[300] : Theme.of(context).primaryColor),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
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
        ),
        Positioned(
            top: -3,
            left: isMe ? null : 110,
            right: isMe ? 110 : null,
            child: CircleAvatar(
              backgroundImage: NetworkImage(userImage),
            ))
      ],
      overflow: Overflow.visible,
    );
  }
}
