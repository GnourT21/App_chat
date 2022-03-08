import 'package:flash_chat/ultilities/constrains.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({Key? key, required this.mess}) : super(key: key);
  final String mess;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 16.0, bottom: 6.0),
              child: const Text(
                '@Maximum',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black26,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 16.0, left: 16.0),
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 14.0),
              decoration: BoxDecoration(
                color: Colors.amber.shade300,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  kShadow,
                ],
              ),
              child: Text(
                mess,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
