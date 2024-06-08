import 'package:flutter/material.dart';
import 'package:insta_clone/custom_icons_icons.dart';

class AnimatedHeart extends StatelessWidget {
  const AnimatedHeart(
      {super.key,
      required this.isLiked,
      required this.defaultIconColor,
      required this.colorOnAnimation,
      required this.likeAnimationController,
      required this.likeScaleAnimation,
      required this.onIconTap});
  final bool isLiked;
  final Color defaultIconColor;
  final Color colorOnAnimation;
  final AnimationController likeAnimationController;
  final Animation likeScaleAnimation;
  final void Function() onIconTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onIconTap,
      child: AnimatedBuilder(
        animation: likeAnimationController,
        builder: (context, child) {
          return Transform.scale(
            scale: likeScaleAnimation.value,
            child: Icon(
              isLiked ? CustomIcons.heartSolid : CustomIcons.heart,
              color: isLiked ? colorOnAnimation : defaultIconColor,
            ),
          );
        },
      ),
    );
  }
}
