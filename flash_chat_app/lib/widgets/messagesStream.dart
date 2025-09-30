import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'messageBubble.dart';


class MessagesStream extends StatelessWidget {
  final Stream<QuerySnapshot> fireStore;

  const MessagesStream({super.key, required this.fireStore});

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser?.email;
    return Expanded(
      child: StreamBuilder(
        stream: fireStore,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            final messages = snapshot.data?.docs;
            // List<Text> messagesWidgets = [];
            // for (var message in messages!) {
            //   final messageText = message.data()['text'];
            //   final messageSender = message.data()['sender'];
            //
            //   final messageWidget = Text(
            //     '$messageText from $messageSender',
            //   );
            //   messagesWidgets.add(messageWidget);
            // }
            // return Column(children: messagesWidgets);
            return ListView.builder(
              reverse: true,
              itemCount: messages?.length,
              itemBuilder: (context, index) {
                final message = messages?[index];
                final messageText = message?['text'] ?? '';
                final messageSender = message?['sender'] ??'';

                print('current user : $currentUser');

                final isMe = messageSender == currentUser ;
                print(isMe);
                // final isMe = true;
                return MessageBubble(isMe: isMe, messageText: messageText,messageSender: messageSender,);
              },
            );
          }
          return Text('no data');
        },
      ),
    );
  }
}
