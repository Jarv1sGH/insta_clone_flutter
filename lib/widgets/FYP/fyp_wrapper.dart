import 'package:flutter/material.dart';
import 'package:insta_clone/models/post_model.dart';
import 'package:insta_clone/screens/fyp.dart';
import 'package:insta_clone/widgets/FYP/floating_posts.dart';

class FypWrapper extends StatefulWidget {
  const FypWrapper({super.key});

  @override
  State<FypWrapper> createState() => _FypWrapperState();
}

class _FypWrapperState extends State<FypWrapper> {
  bool isPressed = false;
  bool isReel = false;
  PostModel? post;

  void updateIsPressed(
      {required bool isPressed,
      required PostModel post,
      required bool isReel}) {
    setState(() {
      this.isPressed = isPressed;
      this.isReel = isReel;
      this.post = post;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ForYouScreen(
          updateIsPressed: updateIsPressed,
        ),
        if (isPressed == true && post != null)
          FloatingPost(
            isReel: isReel,
            post: post!,
          ),
      ],
    );
  }
}
