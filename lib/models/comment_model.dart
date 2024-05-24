class CommentModel {
  const CommentModel(
    this.username,
    this.profileImg,
    this.numOfLikes,
    this.time,
    this.comment,
  );

  final String username;
  final String comment;
  final String profileImg;
  final int numOfLikes;
  final String time;
}
