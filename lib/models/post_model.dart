import 'package:insta_clone/models/comment_model.dart';

class PostModel {
  const PostModel(
    this.username,
    this.profileImg,
    this.location,
    this.numOfLikes,
    this.numOfShares,
    this.caption,
    this.time,
    this.media,
    this.comments,
  );

  final String username;
  final String profileImg;
  final String location;
  final int numOfLikes;
  final int numOfShares;
  final String caption;
  final String time;
  final List<String> media;
  final List<CommentModel> comments;
}
