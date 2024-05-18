import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture(
      {super.key, required this.imageWidth, required this.imageHeight});
  final double imageWidth;
  final double imageHeight;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: imageWidth,
      height: imageHeight,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: ClipOval(
        child: Image.asset(
          'assets/profile_pics/profile.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
