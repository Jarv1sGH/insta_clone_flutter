import 'package:flutter/material.dart';
import 'package:insta_clone/custom_icons_icons.dart';

class OverlayHeart extends StatelessWidget {
  const OverlayHeart({
    super.key,
    required this.isHeartVisible,
    required this.likeAnimationController,
    required this.likeScaleAnimation,
    required this.boxHeight,
  });
  final bool isHeartVisible;
  final AnimationController likeAnimationController;
  final Animation likeScaleAnimation;
  final double boxHeight;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: boxHeight,
      child: Center(
        child: AnimatedOpacity(
          opacity: isHeartVisible ? 1 : 0,
          duration: const Duration(milliseconds: 100),
          child: AnimatedBuilder(
              animation: likeAnimationController,
              builder: (context, child) {
                return Transform.scale(
                  scale: likeScaleAnimation.value,
                  child: const Icon(
                    size: 90,
                    CustomIcons.heartSolid,
                    color: Colors.white,
                  ),
                );
              }),
        ),
      ),
    );
  }
}
