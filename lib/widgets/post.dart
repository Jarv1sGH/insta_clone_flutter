import 'package:flutter/material.dart';
import 'package:insta_clone/custom_icons_icons.dart';
import 'package:insta_clone/widgets/profile_picture.dart';

class Post extends StatelessWidget {
  const Post({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 8),
          child: Row(
            children: [
              ProfilePicture(
                imageWidth: 35,
                imageHeight: 35,
              ),
              SizedBox(
                width: 8,
              ),
              Text('auroramusic'),
              Spacer(),
              Icon(Icons.more_vert_rounded),
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
                    child: Icon(CustomIcons.heart),
                  ),
                  Text('1.2M'),
                  SizedBox(
                    width: 12,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: Icon(CustomIcons.comment),
                  ),
                  Text('20'),
                  SizedBox(
                    width: 12,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: Icon(CustomIcons.send),
                  ),
                  Text('6000'),
                  SizedBox(
                    width: 12,
                  ),
                  Spacer(),
                  Icon(CustomIcons.save),
                ],
              ),
              Text(
                'Dummy text goes brrrrrrrrrrrrrrrrrrrrrrrrrr, lorem ipsum dolor sit is so 2019 ',
              ),
              Text('View all comments'),
              Text('16 hours ago'),
            ],
          ),
        ),
      ],
    );
  }
}
