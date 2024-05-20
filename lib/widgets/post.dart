import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:insta_clone/custom_icons_icons.dart';
import 'package:insta_clone/models/post_model.dart';
import 'package:insta_clone/widgets/mediaCarousel/media_carousel.dart';
import 'package:insta_clone/widgets/profile_picture.dart';
import 'package:intl/intl.dart';

class Post extends StatefulWidget {
  const Post({super.key, required this.post});

  final PostModel post;

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> with SingleTickerProviderStateMixin {
  final List<String> imgList = [
    'assets/profile_pics/profile.png',
    'assets/posts/post.png',
    'assets/posts/post.png',
    'assets/profile_pics/profile.png',
    'assets/posts/post.png',
  ];
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  int numOfLikes = 0;
  bool _isLiked = false;
  bool _isHeartVisible = false;
  @override
  @override
  void initState() {
    super.initState();
    numOfLikes = widget.post.numOfLikes;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        }
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onIconPressed(bool doubleTap) {
    setState(() {
      // if called from double tap just shows the animation if the post is already liked else
      // calls the animation and increase the like count.
      if (doubleTap) {
        if (_isLiked) {
          _animationController.forward();
          return;
        } else {
          _isLiked = true;
          _animationController.forward();
          numOfLikes++;
        }
      } else {
        if (_isLiked) {
          _animationController.reverse();
          numOfLikes--;
        } else {
          _animationController.forward();
          numOfLikes++;
        }
        _isLiked = !_isLiked;
      }
    });
  }

  void _doubleTapHandler() {
    setState(() {
      _isHeartVisible = true;
      _onIconPressed(true);
      _animationController.forward();
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          _isHeartVisible = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 8),
          child: Row(
            children: [
              ProfilePicture(
                imageWidth: 35,
                imageHeight: 35,
                imagePath: widget.post.profileImg,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(widget.post.username,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const Spacer(),
              InkWell(
                onTap: () {},
                child: const Icon(Icons.more_vert_rounded),
              )
            ],
          ),
        ),
        InkWell(
            onDoubleTap: _doubleTapHandler,
            child: Stack(
              children: [
                MediaCarousel(
                  mediaLength: widget.post.media.length,
                  imgList: widget.post.media,
                ),
                SizedBox(
                  height: 400,
                  child: Center(
                    child: AnimatedOpacity(
                      opacity: _isHeartVisible ? 1 : 0,
                      duration: const Duration(milliseconds: 100),
                      child: AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) {
                            return Transform.scale(
                              scale: _scaleAnimation.value,
                              child: const Icon(
                                size: 90,
                                CustomIcons.heartSolid,
                                color: Colors.white,
                              ),
                            );
                          }),
                    ),
                  ),
                ),
              ],
            )),
        Row(
          children: [
            IconButton(
              onPressed: () {
                _onIconPressed(false);
              },
              style: ButtonStyle(
                  iconColor: _isLiked
                      ? MaterialStateProperty.all<Color>(Colors.red)
                      : null),
              icon: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Icon(
                      _isLiked ? CustomIcons.heartSolid : CustomIcons.heart,
                      color: _isLiked ? Colors.red : null,
                    ),
                  );
                },
              ),
              visualDensity: VisualDensity.compact,
            ),
            Text(NumberFormat.compact().format(numOfLikes)),
            IconButton(
              onPressed: () {},
              icon: const Icon(CustomIcons.comment),
              visualDensity: VisualDensity.compact,
            ),
            Text(NumberFormat.compact().format(widget.post.numOfComments)),
            IconButton(
              onPressed: () {},
              icon: const Icon(CustomIcons.send),
              visualDensity: VisualDensity.compact,
            ),
            Text(NumberFormat.compact().format(widget.post.numOfShares)),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(CustomIcons.save),
              visualDensity: VisualDensity.compact,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(TextSpan(children: [
                      TextSpan(
                        text: '${widget.post.username} ',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: widget.post.caption,
                      )
                    ])),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        'View all comments',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        widget.post.time,
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
