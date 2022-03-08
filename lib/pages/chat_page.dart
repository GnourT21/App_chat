import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/components/new_message.dart';
import 'package:flash_chat/ultilities/constrains.dart';
import 'package:flutter/material.dart';

import '../components/messages.dart';

class ChatPage extends StatefulWidget {
  static const String route = '/';
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flash Chat'),
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseFirestore.instance.collection('chats').add({
                'text': 'This is another test',
              });
            },
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: Column(
        children: const [
          Expanded(
            child: Messages(),
          ),
          NewMessage()
        ],
      ),
    );
  }
}
