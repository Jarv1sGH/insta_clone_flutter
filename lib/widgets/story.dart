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
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Colors.yellowAccent,
                      Colors.red,
                      Colors.purple,
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              Container(
                height: 83,
                width: 83,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Center(
                  child: Container(
                    height: 78,
                    width: 78,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: const ProfilePicture(
                      imageWidth: 70,
                      imageHeight: 70,
                      imagePath: 'assets/profile_pics/profile.png',
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          const Text('auroramusic'),
        ],
      ),
    );
  }
}
