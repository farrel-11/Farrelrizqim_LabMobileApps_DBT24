import 'package:flutter/material.dart';
import '../models/post_models.dart';

class ChatBubbles extends StatelessWidget {
  final MessageModel message;

  const ChatBubbles({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMe = message.isMe;
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue[700] : Colors.grey[800],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          message.text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}