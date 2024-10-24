class VideoModel {
  final String videoUrl;
  final String thumbnail;
  final String title;
  final String datePublished;
  final String views;
  final String videoId;
  final String userId;
  final List likes;
  final String type;

  VideoModel({
    required this.videoUrl,
    required this.thumbnail,
    required this.title,
    required this.datePublished,
    required this.views,
    required this.videoId,
    required this.userId,
    required this.likes,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'videoUrl': videoUrl,
      'thumbnail': thumbnail,
      'title': title,
      'datePublished': datePublished,
      'views': views,
      'videoId': videoId,
      'userId': userId,
      'likes': likes,
      'type': type,
    };
  }

  factory VideoModel.fromMap(Map<String, dynamic> map) {
    return VideoModel(
      videoUrl: map['videoUrl'] as String,
      thumbnail: map['thumbnail'] as String,
      title: map['title'] as String,
      datePublished: map['datePublished'] as String,
      views: map['views'] as String,
      videoId: map['videoId'] as String,
      userId: map['userId'] as String,
      likes: List.from(
        (map['likes'] as List),
      ),
      type: map['type'] as String,
    );
  }
}
