import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/components/message_bubble.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('chats')
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData) {
          return const Center(
            child: Text(
              'No Messages!',
            ),
          );
        }
        final docs = snapshot.data!.docs;
        return ListView.builder(
          reverse: true,
          itemCount: docs.length,
          itemBuilder: (context, index) {
            return MessageBubble(
              mess: docs[index]['text'],
            );
          },
        );
      },
    );
  }
}
