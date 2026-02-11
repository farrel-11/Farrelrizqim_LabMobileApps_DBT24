import 'package:flutter/material.dart';
import '../models/storyinsta_models.dart';

class InstaStory extends StatelessWidget {
  final StoryModel story;

  const InstaStory({Key? key, required this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(3), 
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: story.isViewed
                  ? null
                  : const LinearGradient(
                      colors: [Colors.purple, Colors.orange, Colors.red],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
              border: story.isViewed ? Border.all(color: Colors.grey) : null,
            ),
            child: Container(
              padding: const EdgeInsets.all(2), 
              decoration: const BoxDecoration(
                color: Colors.black, 
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 32,
                backgroundImage: NetworkImage(story.imageUrl),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            story.username,
            style: const TextStyle(fontSize: 12, color: Colors.white),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}