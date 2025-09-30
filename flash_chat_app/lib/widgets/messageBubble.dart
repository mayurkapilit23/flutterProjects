import 'package:flash_chat_app/constants.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final isMe;
  final messageText;
  String messageSender;

  MessageBubble({
    super.key,
    this.isMe,
    this.messageText,
    required this.messageSender,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      // alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: isMe
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              color: isMe ? AppColors.messageBgColor : AppColors.buttonBgColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: isMe ? Radius.circular(12) : Radius.zero,
                bottomRight: isMe ? Radius.zero : Radius.circular(12),
              ),
            ),

            child: Text(
              messageText,
              style: TextStyle(color: isMe ? Colors.black : Colors.white),
            ),
          ),
          isMe? Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(50),
            ),

            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                messageSender[0].toUpperCase(),
                style: TextStyle(color: Colors.white,fontSize: 10),
              ),
            ),
          ):Text(''),
        ],
      ),
    );

  }
}
