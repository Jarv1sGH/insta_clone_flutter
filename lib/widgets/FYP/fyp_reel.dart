import 'package:flutter/material.dart';
import 'package:insta_clone/models/post_model.dart';
import 'package:video_player/video_player.dart';

class FypReel extends StatefulWidget {
  const FypReel({super.key, required this.reel});
  final PostModel reel;
  @override
  State<FypReel> createState() => _FypReelState();
}

class _FypReelState extends State<FypReel> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(widget.reel.media[0])
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.play();
        _videoPlayerController.setLooping(true);
        _videoPlayerController.setVolume(0);
      });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: _videoPlayerController.value.aspectRatio,
        child: VideoPlayer(_videoPlayerController));
  }
}
