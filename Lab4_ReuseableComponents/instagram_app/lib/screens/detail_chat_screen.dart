import 'package:flutter/material.dart';
import '../data/mockup_data.dart';
import '../widgets/chat_bubbles.dart';

class DetailChatScreen extends StatelessWidget {
  final String username;
  const DetailChatScreen({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const BackButton(),
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=11"),
              radius: 16,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(username, style: const TextStyle(fontSize: 16)),
                const Text("Active now", style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ],
        ),
        actions: const [
          Icon(Icons.call), 
          SizedBox(width: 15),
          Icon(Icons.video_call),
          SizedBox(width: 15),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ChatBubbles(message: messages[index]);
              },
            ),
          ),
          _buildInputBar(),
        ],
      ),
    );
  }

  Widget _buildInputBar() {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF262626),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Container(
             padding: const EdgeInsets.all(8),
             decoration: const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
             child: const Icon(Icons.camera_alt, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Message...",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
          const Icon(Icons.mic, color: Colors.white),
          const SizedBox(width: 10),
          const Icon(Icons.image, color: Colors.white),
          const SizedBox(width: 10),
          const Icon(Icons.favorite_border, color: Colors.white),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}