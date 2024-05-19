class PostModel {
  const PostModel(
      this.username,
      this.profileImg,
      this.location,
      this.numOfLikes,
      this.numOfComments,
      this.numOfShares,
      this.caption,
      this.time,
      this.media);

  final String username;
  final String profileImg;
  final String location;
  final int numOfLikes;
  final int numOfComments;
  final int numOfShares;
  final String caption;
  final String time;
  final List<String> media;
}
