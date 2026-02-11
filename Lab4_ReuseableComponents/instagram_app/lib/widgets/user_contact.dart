import 'package:flutter/material.dart';
import '../models/post_models.dart';

class UserContact extends StatelessWidget {
  final ChatModel chat;
  final VoidCallback onTap;

  const UserContact({Key? key, required this.chat, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        radius: 28,
        backgroundImage: NetworkImage(chat.userImage),
      ),
      title: Text(
        chat.username,
        style: TextStyle(
          color: Colors.white,
          fontWeight: chat.isUnread ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      subtitle: Text(
        chat.lastMessage,
        style: TextStyle(
          color: chat.isUnread ? Colors.white : Colors.grey,
          fontWeight: chat.isUnread ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      trailing: const Icon(Icons.camera_alt_outlined, color: Colors.grey),
    );
  }
}