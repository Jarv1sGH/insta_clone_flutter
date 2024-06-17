import 'package:flutter/material.dart';
import 'package:insta_clone/custom_icons_icons.dart';
import 'package:insta_clone/models/post_model.dart';
import 'package:insta_clone/widgets/Post/caption_row.dart';
import 'package:insta_clone/widgets/Post/Comment/comments.dart';
import 'package:insta_clone/widgets/Post/post_options.dart';
import 'package:insta_clone/widgets/mediaCarousel/media_carousel.dart';
import 'package:insta_clone/widgets/profile_picture.dart';
import 'package:insta_clone/widgets/reusableWidgets/overlay_heart.dart';
import 'package:intl/intl.dart';

class Post extends StatefulWidget {
  const Post({super.key, required this.post});

  final PostModel post;

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> with TickerProviderStateMixin {
  late AnimationController _likeAnimationController;
  late Animation<double> _likeScaleAnimation;
  late AnimationController _saveAnimationController;
  late Animation<double> _saveScaleAnimation;
  int numOfLikes = 0;
  bool _isLiked = false;
  bool _isSaved = false;
  bool _isHeartVisible = false;

  @override
  void initState() {
    super.initState();
    numOfLikes = widget.post.numOfLikes;
    _likeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
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
    _saveAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _saveScaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _saveAnimationController,
        curve: Curves.easeInOut,
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _saveAnimationController.reverse();
        }
      });
  }

  @override
  void dispose() {
    _likeAnimationController.dispose();
    _saveAnimationController.dispose();
    super.dispose();
  }

  void _onLikeIconPressed(bool doubleTap) {
    setState(() {
      _likeAnimationController.forward();
      // if called from double tap just shows the animation if the post is already liked else
      // calls the animation and increase the like count.
      if (doubleTap) {
        if (_isLiked) {
          return;
        } else {
          _isLiked = true;
          numOfLikes++;
        }
      } else {
        if (_isLiked) {
          numOfLikes--;
        } else {
          numOfLikes++;
        }
        _isLiked = !_isLiked;
      }
    });
  }

  void _doubleTapHandler() {
    setState(() {
      _isHeartVisible = true;
      _onLikeIconPressed(true);
      _likeAnimationController.forward();
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          _isHeartVisible = false;
        });
      });
    });
  }

  void _showOptions() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (ctx) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.65,
            child: PostOptions(),
          );
        });
  }

  void _showComment() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (ctx) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.95,
            child: Comments(
              comments: widget.post.comments,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top row with username and options
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
                onTap: _showOptions,
                child: const Icon(Icons.more_vert_rounded),
              )
            ],
          ),
        ),

        // Images & video
        InkWell(
          onDoubleTap: _doubleTapHandler,
          child: Stack(
            children: [
              MediaCarousel(
                mediaLength: widget.post.media.length,
                imgList: widget.post.media,
              ),
              OverlayHeart(
                isHeartVisible: _isHeartVisible,
                likeAnimationController: _likeAnimationController,
                likeScaleAnimation: _likeScaleAnimation,
                boxHeight: 400,
              )
            ],
          ),
        ),

        // Row with likes , comment and share icons
        Row(
          children: [
            IconButton(
              onPressed: () {
                _onLikeIconPressed(false);
              },
              style: ButtonStyle(
                  iconColor: _isLiked
                      ? WidgetStateProperty.all<Color>(Colors.red)
                      : null),
              icon: AnimatedBuilder(
                animation: _likeAnimationController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _likeScaleAnimation.value,
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
              onPressed: _showComment,
              icon: const Icon(CustomIcons.comment),
              visualDensity: VisualDensity.compact,
            ),
            Text(NumberFormat.compact().format(widget.post.comments.length)),
            IconButton(
              onPressed: () {},
              icon: const Icon(CustomIcons.send),
              visualDensity: VisualDensity.compact,
            ),
            Text(NumberFormat.compact().format(widget.post.numOfShares)),
            const Spacer(),
            IconButton(
              onPressed: () {
                setState(() {
                  if (_isSaved) {
                    _saveAnimationController.reverse();
                  } else {
                    _saveAnimationController.forward();
                  }
                  _isSaved = !_isSaved;
                });
              },
              icon: AnimatedBuilder(
                  animation: _saveAnimationController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _saveScaleAnimation.value,
                      child: Icon(_isSaved ? Icons.bookmark : CustomIcons.save),
                    );
                  }),
              visualDensity: VisualDensity.compact,
            ),
          ],
        ),

        // Row with caption comments and upload details
        CaptionRow(
          caption: widget.post.caption,
          time: widget.post.time,
          username: widget.post.username,
          showComments: _showComment,
        )
      ],
    );
  }
}
