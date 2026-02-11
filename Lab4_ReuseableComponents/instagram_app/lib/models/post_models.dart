class PostModel {
  final String username;
  final String userImage;
  final String postImage;
  final String caption;
  final int likes;

  PostModel({
    required this.username,
    required this.userImage,
    required this.postImage,
    required this.caption,
    required this.likes,
  });
}

class ChatModel {
  final String username;
  final String userImage;
  final String lastMessage;
  final String time;
  final bool isUnread;

  ChatModel({
    required this.username,
    required this.userImage,
    required this.lastMessage,
    required this.time,
    this.isUnread = false,
  });
}

class MessageModel {
  final String text;
  final bool isMe;
  final String time;

  MessageModel({required this.text, required this.isMe, required this.time});
}