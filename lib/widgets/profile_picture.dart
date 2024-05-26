import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
    required this.imageWidth,
    required this.imageHeight,
    required this.imagePath,
    this.rounded = true,
  });
  final double imageWidth;
  final double imageHeight;
  final String imagePath;
  final bool rounded;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: imageWidth,
      height: imageHeight,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: rounded
          ? ClipOval(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            )
          : Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
    );
  }
}
