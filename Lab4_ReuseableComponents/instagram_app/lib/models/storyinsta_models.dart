class StoryModel {
  final String username;
  final String imageUrl;
  final bool isViewed;

  StoryModel({
    required this.username, 
    required this.imageUrl, 
    this.isViewed = false
  });
}