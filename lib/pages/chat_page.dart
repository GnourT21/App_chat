import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/new_message.dart';
import 'package:flash_chat/provider/auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            onPressed: () => context.read<AutheProvider>().signOut(context),
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
