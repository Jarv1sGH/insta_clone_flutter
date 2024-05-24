import 'package:flutter/material.dart';
import 'package:insta_clone/custom_icons_icons.dart';
import 'package:insta_clone/models/comment_model.dart';
import 'package:insta_clone/widgets/profile_picture.dart';

class Comment extends StatefulWidget {
  const Comment({
    super.key,
    required this.comment,
  });
  final CommentModel comment;

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> with SingleTickerProviderStateMixin {
  late AnimationController _likeAnimationController;
  late Animation<double> _likeScaleAnimation;
  bool _isLiked = false;
  int _numOfLikes = 0;
  @override
  void initState() {
    _numOfLikes = widget.comment.numOfLikes;
    super.initState();
    _likeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );

    _likeScaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _likeAnimationController,
        curve: Curves.easeInOut,
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _likeAnimationController.reverse();
        }
      });
  }

  @override
  void dispose() {
    _likeAnimationController.dispose();
    super.dispose();
  }

  void _commentLikeHandler() {
    setState(() {
      if (_isLiked) {
        _likeAnimationController.forward();
        _numOfLikes--;
      } else {
        _likeAnimationController.forward();
        _numOfLikes++;
      }
      _isLiked = !_isLiked;
    });
  }

  void _onCommentDoubleTap() {
    setState(() {
      if (_isLiked) {
        return;
      } else {
        _likeAnimationController.forward();
        _isLiked = true;
        _numOfLikes++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 16, top: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ProfilePicture(
              imageWidth: 40,
              imageHeight: 40,
              imagePath: widget.comment.profileImg,
            ),
          ),
          InkWell(
            onDoubleTap: _onCommentDoubleTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.comment.username,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      widget.comment.time,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 280,
                  child: Text(
                    softWrap: true,
                    widget.comment.comment,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Reply',
                  style: TextStyle(
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Column(
            children: [
              InkWell(
                  onTap: _commentLikeHandler,
                  child: AnimatedBuilder(
                      animation: _likeAnimationController,
                      builder: (ctx, child) {
                        return Transform.scale(
                          scale: _likeScaleAnimation.value,
                          child: Icon(
                            _isLiked
                                ? CustomIcons.heartSolid
                                : CustomIcons.heart,
                            color: _isLiked ? Colors.red : null,
                            size: 18,
                          ),
                        );
                      })),
              Text(
                _numOfLikes.toString(),
                style: const TextStyle(fontSize: 11),
              )
            ],
          ),
        ],
      ),
    );
  }
}
