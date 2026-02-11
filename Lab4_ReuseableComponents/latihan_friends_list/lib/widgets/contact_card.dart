import 'package:flutter/material.dart';
import '../models/contact_model.dart';
import '../screens/chat_screen.dart';

class ContactCard extends StatelessWidget {
  final ContactModel contact;

  const ContactCard({
    super.key,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(contact.avatarUrl),
          radius: 25,
        ),
        title: Text(
          contact.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          contact.message,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Text(
          contact.time,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatScreen(contact: contact),
            ),
          );
        },
      ),
    );
  }
}