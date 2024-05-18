import 'package:flutter/material.dart';
import 'package:insta_clone/widgets/post.dart';
import 'package:insta_clone/widgets/story.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.chat_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(
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
      ),
    );
  }
}
