import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta_clone/custom_icons_icons.dart';
import 'package:insta_clone/widgets/Post/post.dart';
import 'package:insta_clone/widgets/story.dart';
import 'package:insta_clone/data/post_data.dart';
import 'package:insta_clone/widgets/user_story.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instagram',
          style: GoogleFonts.getFont('Lobster Two', fontSize: 28),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CustomIcons.heart),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CustomIcons.messenger,
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 140,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 0.1),
                ),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  const UserStory(),
                  ...List.generate(
                    10,
                    (index) => Story(
                      index: index,
                    ),
                  ),
                ]),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: postData.length,
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Post(post: postData[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
