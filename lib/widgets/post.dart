import 'package:flutter/material.dart';
import 'package:insta_clone/custom_icons_icons.dart';
import 'package:insta_clone/models/post_model.dart';
import 'package:insta_clone/widgets/mediaCarousel/media_carousel.dart';
import 'package:insta_clone/widgets/profile_picture.dart';
import 'package:intl/intl.dart';

class Post extends StatelessWidget {
  Post({super.key, required this.post});

  final List<String> imgList = [
    'assets/profile_pics/profile.png',
    'assets/posts/post.png',
    'assets/posts/post.png',
    'assets/profile_pics/profile.png',
    'assets/posts/post.png',
  ];
  final PostModel post;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 8),
          child: Row(
            children: [
              ProfilePicture(
                imageWidth: 35,
                imageHeight: 35,
                imagePath: post.profileImg,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(post.username,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const Spacer(),
              InkWell(
                onTap: () {},
                child: const Icon(Icons.more_vert_rounded),
              )
            ],
          ),
        ),
        MediaCarousel(
          mediaLength: post.media.length,
          imgList: post.media,
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(CustomIcons.heart),
              visualDensity: VisualDensity.compact,
            ),
            Text(NumberFormat.compact().format(post.numOfLikes)),
            IconButton(
              onPressed: () {},
              icon: const Icon(CustomIcons.comment),
              visualDensity: VisualDensity.compact,
            ),
            Text(NumberFormat.compact().format(post.numOfComments)),
            IconButton(
              onPressed: () {},
              icon: const Icon(CustomIcons.send),
              visualDensity: VisualDensity.compact,
            ),
            Text(NumberFormat.compact().format(post.numOfShares)),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(CustomIcons.save),
              visualDensity: VisualDensity.compact,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(TextSpan(children: [
                      TextSpan(
                        text: '${post.username} ',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: post.caption,
                      )
                    ])),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        'View all comments',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        post.time,
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
