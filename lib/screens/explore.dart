import 'package:flutter/material.dart';
import 'package:insta_clone/models/post_model.dart';
import 'package:insta_clone/widgets/Post/post.dart';
import 'package:insta_clone/data/post_data.dart';

class Explore extends StatelessWidget {
  const Explore({super.key, required this.post});
  final PostModel post;
  @override
  Widget build(BuildContext context) {
    final List<PostModel> explorePosts = [post, ...postData];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Explore',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
          itemCount: explorePosts.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Post(post: explorePosts[index]),
            );
          }),
    );
  }
}
