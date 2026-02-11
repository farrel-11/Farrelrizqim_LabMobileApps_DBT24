import 'package:flutter/material.dart';
import '../data/mockup_data.dart';
import '../widgets/contact_card.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Chats",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
      ),
      body: ListView.builder(
        itemCount: mockContacts.length,
        itemBuilder: (context, index) {
          final singleContact = mockContacts[index];
          return ContactCard(contact: singleContact);
        },
      ),
    );
  }
}