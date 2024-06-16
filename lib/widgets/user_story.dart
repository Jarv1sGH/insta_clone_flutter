import 'package:flutter/material.dart';
import 'package:insta_clone/widgets/profile_picture.dart';

class UserStory extends StatelessWidget {
  const UserStory({super.key});
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
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              Container(
                height: 83,
                width: 83,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
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
              Positioned(
                bottom: 6,
                right: 4,
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                      color: Colors.blue[400],
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(9999)),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          const Text('user'),
        ],
      ),
    );
  }
}
