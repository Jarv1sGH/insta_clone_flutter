import 'package:flutter/material.dart';
import 'package:insta_clone/models/post_model.dart';
import 'package:insta_clone/screens/explore.dart';
import 'package:insta_clone/screens/reels_screen.dart';
import 'package:insta_clone/widgets/FYP/fyp_reel.dart';
// import 'package:insta_clone/widgets/FYP/floating_posts.dart';

class FypRow extends StatelessWidget {
  const FypRow({
    super.key,
    required this.index,
    required this.rowData,
    required this.showFloatingPost,
  });
  final int index;
  final List<PostModel> rowData;
  final Function({
    required bool isPressed,
    required PostModel post,
    required bool isReel,
  }) showFloatingPost;
  void onPostTap(PostModel item, context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return Explore(post: item);
    }));
  }

  void onReelTap(PostModel item, context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return ReelsScreen(reel: item);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection:
          index == 0 || index % 2 == 0 ? TextDirection.ltr : TextDirection.rtl,
      children: [
        SizedBox(
          // color: Colors.black,
          // decoration: BoxDecoration(border: Border.all()),
          width: MediaQuery.of(context).size.width * 0.6667,
          height: 250,
          child: Wrap(
              spacing: 1,
              runSpacing: 1,
              children: rowData.take(4).map(
                (item) {
                  return SizedBox(
                      width:
                          (MediaQuery.of(context).size.width * 0.6667) / 2 - 1,
                      height:
                          124, // Half of the height of the parent container - 1 for spacing
                      child: Stack(
                        children: [
                          GestureDetector(
                            onLongPress: () {
                              showFloatingPost(
                                isPressed: true,
                                post: item,
                                isReel: false,
                              );
                            },
                            onLongPressEnd: (_) {
                              showFloatingPost(
                                isPressed: false,
                                post: item,
                                isReel: false,
                              );
                            },
                            onTap: () {
                              onPostTap(item, context);
                            },
                            child: Image.asset(
                              width: double.infinity,
                              height: double.infinity,
                              item.media[0],
                              fit: BoxFit.cover,
                            ),
                          ),
                          if (item.media.length > 1)
                            const Positioned(
                                top: 4,
                                right: 4,
                                child: Icon(
                                  Icons.copy_outlined,
                                  size: 16,
                                  color: Colors.white,
                                )),
                        ],
                      ));
                },
              ).toList()),
        ),
        Expanded(
          child: SizedBox(
            width: double.infinity,
            height: 250,
            child: Padding(
                padding: const EdgeInsets.all(1),
                child: GestureDetector(
                  onLongPress: () {
                    showFloatingPost(
                      isPressed: true,
                      post: rowData[4],
                      isReel: true,
                    );
                  },
                  onLongPressEnd: (_) {
                    showFloatingPost(
                      isPressed: false,
                      post: rowData[4],
                      isReel: true,
                    );
                  },
                  onTap: () {
                    onReelTap(rowData[4], context);
                  },
                  child: FypReel(
                    reel: rowData[4],
                  ),
                )),
          ),
        )
      ],
    );
  }
}
