import 'package:flutter/material.dart';
import 'package:insta_clone/data/reels_data.dart';
import 'package:insta_clone/widgets/ReelsPlayer/reel_player.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              itemCount: reels.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (ctx, index) {
                return ReelPlayer(
                  reel: reels[index],
                );
              },
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8, top: 4, right: 8),
              child: Row(
                children: [
                  Text(
                    'Reels',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Icon(
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
