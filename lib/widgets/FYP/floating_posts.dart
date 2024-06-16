import 'package:flutter/material.dart';
import 'package:insta_clone/custom_icons_icons.dart';
import 'package:insta_clone/models/post_model.dart';
import 'package:insta_clone/widgets/FYP/fyp_reel.dart';
import 'package:insta_clone/widgets/profile_picture.dart';
import 'dart:ui';

class FloatingPost extends StatelessWidget {
  const FloatingPost({
    super.key,
    required this.post,
    required this.isReel,
  });
  final PostModel post;
  final bool isReel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: SizedBox(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: isReel
                          ? constraints.maxHeight * 0.98
                          : constraints.maxHeight * 0.8,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.black87
                            : Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      width: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 50,
                            decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide(width: 0.2)),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: ProfilePicture(
                                    imageWidth: 30,
                                    imageHeight: 30,
                                    imagePath: post.profileImg,
                                  ),
                                ),
                                Text(
                                  post.username,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: isReel
                                ? FypReel(reel: post)
                                : Image.asset(
                                    post.media[0],
                                  ),
                          ),
                          Container(
                            height: 50,
                            decoration: const BoxDecoration(
                              border: Border(top: BorderSide(width: 0.2)),
                            ),
                            child: const Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Icon(CustomIcons.heart),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Icon(Icons.person),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Icon(CustomIcons.send),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Icon(Icons.more_vert_rounded),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
