import 'package:flutter/material.dart';
import 'package:insta_clone/custom_icons_icons.dart';
import 'package:insta_clone/widgets/ReelsPlayer/reel_info.dart';
import 'package:insta_clone/widgets/profile_picture.dart';
import 'package:insta_clone/widgets/ReelsPlayer/reel_icons.dart';
import 'package:video_player/video_player.dart';

class ReelPlayer extends StatefulWidget {
  const ReelPlayer({super.key, required this.videoUrl});
  final String videoUrl;
  // void Function() toggleAudio;
  @override
  State<ReelPlayer> createState() => _ReelPlayerState();
}

class _ReelPlayerState extends State<ReelPlayer> with TickerProviderStateMixin {
  late VideoPlayerController _videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;
  bool isAudioMuted = false;
  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.asset(widget.videoUrl);
    _initializeVideoPlayerFuture =
        _videoPlayerController.initialize().then((_) {
      _videoPlayerController.play();
      _videoPlayerController.setLooping(true);
      _videoPlayerController.setVolume(1);
    });
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  void _toggleAudio() {
    setState(() {
      isAudioMuted = !isAudioMuted;
      _videoPlayerController.setVolume(isAudioMuted ? 1 : 0);
    });
  }

  final List<Map<String, dynamic>> reelIcons = [
    {'icon': CustomIcons.heart, 'label': '540k'},
    {'icon': CustomIcons.comment, 'label': '988'},
    {'icon': CustomIcons.send, 'label': '540'},
    {'icon': Icons.more_vert_rounded},
  ];

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
              onDoubleTap: () {},
              child: Stack(
                children: [
                  VideoPlayer(_videoPlayerController),
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                      ),
                      child: Row(
                        children: [
                          const Expanded(
                            flex: 9,
                            child: SizedBox(
                              child: ReelInfo(
                                imageUrl: 'assets/profile_pics/profile.png',
                                username: 'philomenacunk',
                                caption: 'philomena on beethoven...',
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ...reelIcons.map((item) {
                                    return ReelIcons(
                                        icon: item['icon'],
                                        label: item['label'] ?? item['label']);
                                  }),
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
