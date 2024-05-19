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
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
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
            (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Post()),
          )
        ],
      ),
    );
  }
}
