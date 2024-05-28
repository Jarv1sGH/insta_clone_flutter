import 'package:flutter/material.dart';
import 'package:insta_clone/widgets/profile_picture.dart';

class ReelInfo extends StatelessWidget {
  const ReelInfo({
    super.key,
    required this.username,
    required this.caption,
    required this.imageUrl,
  });

  final String username;
  final String imageUrl;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfilePicture(
              imageWidth: 40,
              imageHeight: 40,
              imagePath: imageUrl,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              username,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.elliptical(8, 6),
                  ),
                  border: Border.all(
                    color: Colors.white,
                  )),
              width: 90,
              height: 25,
              child: const Center(
                child: Text(
                  'Follow',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              caption,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.all(Radius.elliptical(8, 6))),
              width: 130,
              height: 28,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.music_note_rounded,
                    color: Colors.white,
                  ),
                  Text(
                    'Orignal audio',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.all(
                  Radius.elliptical(8, 6),
                ),
              ),
              width: 100,
              height: 28,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.card_giftcard,
                    color: Colors.white,
                  ),
                  Text(
                    'Send Gift',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
