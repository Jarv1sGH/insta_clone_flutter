import 'package:flutter/material.dart';
import 'package:insta_clone/custom_icons_icons.dart';
import 'package:insta_clone/widgets/mediaCarousel/media_carousel.dart';
import 'package:insta_clone/widgets/profile_picture.dart';

class Post extends StatelessWidget {
  Post({super.key});

  final List<String> imgList = [
    'assets/profile_pics/profile.png',
    'assets/posts/post.png',
    'assets/posts/post.png',
    'assets/profile_pics/profile.png',
    'assets/posts/post.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 8),
          child: Row(
            children: [
              const ProfilePicture(
                imageWidth: 35,
                imageHeight: 35,
              ),
              const SizedBox(
                width: 8,
              ),
              const Text('auroramusic'),
              const Spacer(),
              InkWell(
                onTap: () {},
                child: const Icon(Icons.more_vert_rounded),
              )
            ],
          ),
        ),
        MediaCarousel(
          mediaLength: imgList.length,
          imgList: imgList,
        ),
        Row(
          children: [
            IconButton(
              // style: ButtonStyle(),
              onPressed: () {},
              icon: const Icon(CustomIcons.heart),
              visualDensity: VisualDensity.compact,
            ),
            const Text('1.2M'),
            IconButton(
              onPressed: () {},
              icon: const Icon(CustomIcons.comment),
              visualDensity: VisualDensity.compact,
            ),
            const Text('20'),
            IconButton(
              onPressed: () {},
              icon: const Icon(CustomIcons.send),
              visualDensity: VisualDensity.compact,
            ),
            const Text('6000'),
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
                    const Text.rich(TextSpan(children: [
                      TextSpan(
                        text: 'auroramusic',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                          text:
                              ' Caption goes here eeeeeeeeee hippity hoppity hippity hoppity hippity hoppity')
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
                      child: const Text(
                        '16 hours ago',
                        style: TextStyle(color: Colors.black54),
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
