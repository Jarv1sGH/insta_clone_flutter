import 'package:flutter/material.dart';
import 'package:insta_clone/widgets/post.dart';
import 'package:insta_clone/widgets/story.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 140,
            // decoration: BoxDecoration(border: Border.all()),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  10,
                  (index) {
                    return const Story();
                  },
                ),
              ),
            ),
          ),
          ...List.generate(
            10,
            (index) => const Padding(
                padding: EdgeInsets.symmetric(vertical: 10), child: Post()),
          )
        ],
      ),
    );
  }
}
