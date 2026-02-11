import '../models/post_models.dart';
import '../models/storyinsta_models.dart';

List<StoryModel> stories = [
  StoryModel(username: "Your story", imageUrl: "https://i.pravatar.cc/150?img=1", isViewed: true),
  StoryModel(username: "climberttt", imageUrl: "https://i.pravatar.cc/150?img=2"),
  StoryModel(username: "hokinihangel", imageUrl: "https://i.pravatar.cc/150?img=3"),
  StoryModel(username: "bol_ang", imageUrl: "https://i.pravatar.cc/150?img=4"),
  StoryModel(username: "jessica", imageUrl: "https://i.pravatar.cc/150?img=5"),
];

List<PostModel> posts = [
  PostModel(
    username: "dreamstone.boulders",
    userImage: "https://i.pravatar.cc/150?img=8",
    postImage: "https://picsum.photos/600/800", 
    caption: "Sama coach Latif hari ini latihan dyno! 🧗‍♂️",
    likes: 120,
  ),
  PostModel(
    username: "climb_indo",
    userImage: "https://i.pravatar.cc/150?img=9",
    postImage: "https://picsum.photos/600/801",
    caption: "New routes are up! Come and send it.",
    likes: 85,
  ),
];

List<ChatModel> chats = [
  ChatModel(username: "Christian Wirawan", userImage: "https://i.pravatar.cc/150?img=11", lastMessage: "Active 7m ago", time: "7m", isUnread: true),
  ChatModel(username: "aryasaji", userImage: "https://i.pravatar.cc/150?img=12", lastMessage: "Seen Sunday", time: "Sun"),
  ChatModel(username: "jangandiototin", userImage: "https://i.pravatar.cc/150?img=13", lastMessage: "Active now", time: "Now", isUnread: true),
  ChatModel(username: "Mr.Mangs", userImage: "https://i.pravatar.cc/150?img=14", lastMessage: "Mentioned you in their story", time: "4d"),
];

List<MessageModel> messages = [
  MessageModel(text: "Bro, jadi latihan hari ini?", isMe: false, time: "14:00"),
  MessageModel(text: "Jadi dong, gue udah di gym nih.", isMe: true, time: "14:02"),
  MessageModel(text: "Oke otw, 10 menit lagi sampe.", isMe: false, time: "14:05"),
];