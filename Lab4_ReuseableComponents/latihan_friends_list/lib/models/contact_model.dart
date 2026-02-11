import 'message_model.dart';

class ContactModel {
  final String name;
  final String message; 
  final String time;
  final String avatarUrl;
  final List<MessageModel> chatHistory;

  ContactModel({
    required this.name,
    required this.message,
    required this.time,
    required this.avatarUrl,
    required this.chatHistory,
  });
}