import 'package:flutter/material.dart';
import 'package:insta_clone/data/reels_data.dart';
import 'package:insta_clone/models/post_model.dart';
import 'package:insta_clone/widgets/ReelsPlayer/reel_player.dart';

class ReelsScreen extends StatelessWidget {
  ReelsScreen({super.key, this.reel});

  final PostModel? reel;
  final List<PostModel> reelsArr = [];
  // final Widget appBarWidget;
  @override
  Widget build(BuildContext context) {
    if (reel != null) {
      reelsArr.add(reel!);
    }
    reelsArr.addAll(reels);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              itemCount: reels.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (ctx, index) {
                return ReelPlayer(
                  reel: reelsArr[index],
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 4, right: 8),
              child: Row(
                children: [
                  Row(
                    children: [
                      if (reel != null)
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      const Text(
                        'Reels',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
