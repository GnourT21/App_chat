import 'package:flash_chat/provider/messages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ultilities/constrains.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _textController = TextEditingController();

  void sendMessage() {
    context.read<MessengerProvider>().sendMessage();
    _textController.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
            child: TextField(
              controller: _textController,
              decoration: kTextFieldDecoration.copyWith(
                  constraints: const BoxConstraints(
                    maxHeight: 40,
                    minHeight: 20,
                  ),
                  hintText: 'Enter message here...'),
              onChanged: (value) {
                context.read<MessengerProvider>().setMessage(value);
              },
            ),
          ),
        ),
        IconButton(
          onPressed: sendMessage,
          icon: const Icon(
            Icons.send,
            color: Colors.amber,
          ),
        ),
      ],
    );
  }
}
