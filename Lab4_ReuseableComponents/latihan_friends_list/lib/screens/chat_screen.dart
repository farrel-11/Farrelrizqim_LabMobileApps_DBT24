import 'package:flutter/material.dart';
import '../models/contact_model.dart';
import '../widgets/chat_bubble.dart';

class ChatScreen extends StatelessWidget {
  final ContactModel contact;

  const ChatScreen({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2), 
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(contact.avatarUrl),
              radius: 18,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(contact.name, style: const TextStyle(fontSize: 18)),
                const Text("Online", style: TextStyle(fontSize: 12, color: Colors.black54)),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              itemCount: contact.chatHistory.length,
              itemBuilder: (context, index) {
                final msg = contact.chatHistory[index];
                return ChatBubble(message: msg);
              },
            ),
          ),
          
          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Row(
        children: [
          const Icon(Icons.add, color: Colors.blue),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text("Ketik pesan...", style: TextStyle(color: Colors.grey)),
            ),
          ),
          const SizedBox(width: 10),
          const Icon(Icons.send, color: Colors.blue),
        ],
      ),
    );
  }
}