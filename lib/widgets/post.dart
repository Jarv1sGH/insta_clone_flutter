import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  const Post({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: ClipOval(
                  child: Image.asset(
                    'assets/profile_pics/profile.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              const Text('auroramusic'),
              const Spacer(),
              const Icon(Icons.more_vert_rounded),
            ],
          ),
        ),
        Image.asset(
          'assets/posts/post.png',
          width: double.infinity,
        ),
        // Add Scrolling dots

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: Icon(Icons.favorite),
                  ),
                  Text('1.2M'),
                  SizedBox(
                    width: 12,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: Icon(Icons.mode_comment_outlined),
                  ),
                  Text('20'),
                  SizedBox(
                    width: 12,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: Icon(Icons.send),
                  ),
                  Text('6000'),
                  SizedBox(
                    width: 12,
                  ),
                  Spacer(),
                  Icon(Icons.bookmark_add_outlined),
                ],
              ),
              Text(
                'auroramusic this is going to be a really long sentence but this keybaord fucking sucks aaaaaaaa',
              ),
              Text('View all comments'),
              Text('16 hours ago'),
            ],
          ),
        ),

        // const Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        //   child: Text(
        //     'auroramusic this is going to be a really long sentence but this keybaord fucking sucks aaaaaaaa',
        //   ),
        // )
      ],
    );
  }
}
