import 'package:flutter/material.dart';
import 'package:insta_clone/custom_icons_icons.dart';
import 'package:insta_clone/models/post_model.dart';
import 'package:insta_clone/widgets/Post/Comment/comments.dart';
import 'package:insta_clone/widgets/Post/post_options.dart';
import 'package:insta_clone/widgets/ReelsPlayer/reel_info.dart';
import 'package:insta_clone/widgets/profile_picture.dart';
import 'package:insta_clone/widgets/ReelsPlayer/reel_icons.dart';
import 'package:insta_clone/widgets/reusableWidgets/overlay_heart.dart';
import 'package:video_player/video_player.dart';
import 'package:intl/intl.dart';

class ReelPlayer extends StatefulWidget {
  const ReelPlayer({super.key, required this.reel});
  final PostModel reel;
  @override
  State<ReelPlayer> createState() => _ReelPlayerState();
}

class _ReelPlayerState extends State<ReelPlayer> with TickerProviderStateMixin {
  late AnimationController _likeAnimationController;
  late Animation<double> _likeScaleAnimation;
  int numOfLikes = 0;
  bool _isLiked = false;
  bool _isHeartVisible = false;
  late VideoPlayerController _videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;
  bool isAudioMuted = false;

  @override
  void initState() {
    numOfLikes = widget.reel.numOfLikes;
    _videoPlayerController = VideoPlayerController.asset(widget.reel.media[0]);
    _initializeVideoPlayerFuture =
        _videoPlayerController.initialize().then((_) {
      _videoPlayerController.play();
      _videoPlayerController.setLooping(true);
      _videoPlayerController.setVolume(1);
    });
    _likeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _likeScaleAnimation =
        Tween<double>(begin: 1.0, end: 1.2).animate(CurvedAnimation(
      parent: _likeAnimationController,
      curve: Curves.easeInOut,
    ))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _likeAnimationController.reverse();
            }
          });
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _likeAnimationController.dispose();
    super.dispose();
  }

  void _toggleAudio() {
    setState(() {
      isAudioMuted = !isAudioMuted;
      _videoPlayerController.setVolume(isAudioMuted ? 1 : 0);
    });
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
            height: MediaQuery.of(context).size.height * 0.61,
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
              comments: widget.reel.comments,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
            aspectRatio: _videoPlayerController.value.aspectRatio,
            child: InkWell(
              onTap: _toggleAudio,
              onDoubleTap: () {
                _doubleTapHandler();
              },
              child: Stack(
                children: [
                  VideoPlayer(_videoPlayerController),
                  OverlayHeart(
                    boxHeight: double.infinity,
                    isHeartVisible: _isHeartVisible,
                    likeAnimationController: _likeAnimationController,
                    likeScaleAnimation: _likeScaleAnimation,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 8,
                            child: SizedBox(
                              child: ReelInfo(
                                imageUrl: widget.reel.profileImg,
                                username: widget.reel.username,
                                caption: widget.reel.caption,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  AnimatedBuilder(
                                    animation: _likeAnimationController,
                                    builder: (context, child) {
                                      return Transform.scale(
                                          scale: _likeScaleAnimation.value,
                                          child: ReelIcons(
                                            label: NumberFormat.compact()
                                                .format(numOfLikes),
                                            iconColor: _isLiked
                                                ? Colors.red
                                                : Colors.white,
                                            icon: _isLiked
                                                ? CustomIcons.heartSolid
                                                : CustomIcons.heart,
                                            onIconTap: () {
                                              _onLikeIconPressed(false);
                                            },
                                          ));
                                    },
                                  ),
                                  ReelIcons(
                                    icon: CustomIcons.comment,
                                    onIconTap: _showComment,
                                    iconColor: Colors.white,
                                    label: NumberFormat.compact()
                                        .format(widget.reel.comments.length),
                                  ),
                                  ReelIcons(
                                    icon: CustomIcons.send,
                                    onIconTap: () {},
                                    iconColor: Colors.white,
                                    label: NumberFormat.compact()
                                        .format(widget.reel.numOfShares),
                                  ),
                                  ReelIcons(
                                    icon: Icons.more_vert_rounded,
                                    onIconTap: _showOptions,
                                    iconColor: Colors.white,
                                  ),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(2),
                                      ),
                                    ),
                                    child: const Center(
                                      child: ProfilePicture(
                                        imageWidth: 27,
                                        imageHeight: 27,
                                        rounded: false,
                                        imagePath:
                                            'assets/profile_pics/profile.png',
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
