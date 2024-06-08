import 'package:insta_clone/models/comment_model.dart';

class PostModel {
  const PostModel({
    required this.username,
    required this.profileImg,
    this.location,
    required this.numOfLikes,
    required this.numOfShares,
    required this.caption,
    required this.time,
    required this.media,
    required this.comments,
  });

  final String username;
  final String profileImg;
  final String? location;
  final int numOfLikes;
  final int? numOfShares;
  final String caption;
  final String time;
  final List<String> media;
  final List<CommentModel> comments;
}
