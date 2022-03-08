import 'package:flash_chat/ultilities/constrains.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble(
      {Key? key, required this.mess, required this.name, required this.isMe})
      : super(key: key);
  final String mess;
  final String name;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment:
                !isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
            children: [
              Container(
                margin:
                    const EdgeInsets.only(left: 16.0, bottom: 6.0, right: 16.0),
                child: Text(
                  name.isEmpty ? 'Empty' : name,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black26,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    bottom: 16.0, left: 16.0, right: 16.0),
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 14.0),
                decoration: BoxDecoration(
                  color: isMe ? Colors.amber.shade300 : Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    kShadow,
                  ],
                ),
                child: Text(
                  mess,
                  // style: TextStyle(
                  //   color: isMe ? Colors.white : Colors.black,
                  // ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
