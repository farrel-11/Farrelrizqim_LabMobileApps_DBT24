import '../models/contact_model.dart';
import '../models/message_model.dart';

List<ContactModel> mockContacts = [
  ContactModel(
    name: "Budi Santoso",
    message: "Aman banget brader",
    time: "10:30",
    avatarUrl: "https://i.pravatar.cc/150?u=budi",
    chatHistory: [
      MessageModel(text: "Woy Bud, dimana?", time: "10:00", isMe: true),
      MessageModel(text: "Lagi di jalan nih, macet.", time: "10:05", isMe: false),
      MessageModel(text: "Oalah oke, hati-hati.", time: "10:06", isMe: true),
      MessageModel(text: "Aman banget brader", time: "10:30", isMe: false),
    ],
  ),
  ContactModel(
    name: "Siti Aminah",
    message: "Projectnya sudah selesai ya.",
    time: "09:15",
    avatarUrl: "https://i.pravatar.cc/150?u=siti",
    chatHistory: [
      MessageModel(text: "Mbak Siti, file revisi udah dikirim?", time: "08:00", isMe: true),
      MessageModel(text: "Sudah mas, cek email ya.", time: "08:15", isMe: false),
      MessageModel(text: "Siap makasih.", time: "08:20", isMe: true),
      MessageModel(text: "Projectnya sudah selesai ya.", time: "09:15", isMe: false),
    ],
  ),
  ContactModel(
    name: "Andi Wijaya",
    message: "Besok jadi main bola?",
    time: "07:45",
    avatarUrl: "https://i.pravatar.cc/150?u=andi",
    chatHistory: [
      MessageModel(text: "Besok jadi main bola?", time: "07:45", isMe: false),
    ],
  ),
  ContactModel(
    name: "Dewi Lestari",
    message: "Catet sendiri lah, manja!",
    time: "06:12",
    avatarUrl: "https://i.pravatar.cc/150?u=dewi",
    chatHistory: [
      MessageModel(text: "Dew, pinjem catatatan dong", time: "05:50", isMe: true),
      MessageModel(text: "Catet sendiri lah, manja! ", time: "06:12", isMe: false),
    ],
  ),
  ContactModel(
    name: "Eko Prasetyo",
    message: "Oke siap gan!",
    time: "Kemarin",
    avatarUrl: "https://i.pravatar.cc/150?u=eko",
    chatHistory: [
      MessageModel(text: "Barangnya sudah sampai ya", time: "18:00", isMe: true),
      MessageModel(text: "Oke siap gan!", time: "18:05", isMe: false),
    ],
  ),
  ContactModel(
    name: "Farah Quinn",
    message: "Resepnya sudah saya kirim.",
    time: "Kemarin",
    avatarUrl: "https://i.pravatar.cc/150?u=farah",
    chatHistory: [
      MessageModel(text: "Halo Farah, bisa minta resep kue kemarin?", time: "14:00", isMe: true),
      MessageModel(text: "Boleh, sebentar ya saya cari.", time: "14:10", isMe: false),
      MessageModel(text: "Resepnya sudah saya kirim.", time: "14:15", isMe: false),
    ],
  ),
];