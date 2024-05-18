import 'package:flutter/material.dart';
import 'package:insta_clone/widgets/profile_picture.dart';

class Story extends StatelessWidget {
  const Story({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red, width: 3),
              borderRadius: BorderRadius.circular(999),
            ),
            height: 90,
            width: 90,
            child: const Center(
              child: ProfilePicture(imageWidth: 80, imageHeight: 80),
            ),
          ),
          const Text('aurora'),
        ],
      ),
    );
  }
}
