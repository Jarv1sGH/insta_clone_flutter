import 'package:flutter/material.dart';
import 'package:insta_clone/custom_icons_icons.dart';
import 'package:insta_clone/widgets/Post/Comment/comment.dart';
import 'package:insta_clone/widgets/profile_picture.dart';
import 'package:insta_clone/models/comment_model.dart';

class Comments extends StatefulWidget {
  const Comments({super.key, required this.comments});

  final List<CommentModel> comments;
  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments>
    with SingleTickerProviderStateMixin {
  final TextEditingController _commentController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _paddingAnimation;
  final List<String> _emojiList = [
    '😂',
    '❤',
    '🤣',
    '👏',
    '💀',
    '👻',
    '😹',
    '🙈',
  ];

  void _insertEmoji(String emoji) {
    setState(() {
      _commentController.text += emoji;
    });
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    _paddingAnimation = Tween<double>(begin: 0, end: 0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
  }

  void _updatePadding() {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    _paddingAnimation =
        Tween<double>(begin: _paddingAnimation.value, end: bottomInset).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );
    _animationController.forward(from: 0);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Changes padding (animation) when something like keyboard shows on the screen
    _updatePadding();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 0.2),
            ),
          ),
          width: double.infinity,
          child: const Center(
            child: Column(
              children: [
                Icon(
                  CustomIcons.divider,
                  size: 50,
                ),
                Text(
                  'Comments',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: widget.comments.length,
                  (context, index) {
                    return Comment(
                      comment: widget.comments[index],
                    );
                  },
                ),
              )
            ],
          ),
        ),

        // Comment Container
        AnimatedBuilder(
          animation: _paddingAnimation,
          builder: (ctx, child) {
            return Padding(
              padding: EdgeInsets.only(bottom: _paddingAnimation.value),
              child: child,
            );
          },
          child: Container(
            decoration: const BoxDecoration(
                border: Border(top: BorderSide(width: 0.1))),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                  child: Row(
                    children: [
                      ..._emojiList.map((item) {
                        return Padding(
                          padding:
                              const EdgeInsets.only(left: 9, right: 9, top: 4),
                          child: InkWell(
                            onTap: () {
                              _insertEmoji(item);
                            },
                            child: Text(
                              item,
                              style: const TextStyle(fontSize: 22),
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                  child: Row(
                    children: [
                      const ProfilePicture(
                          imageWidth: 40,
                          imageHeight: 40,
                          imagePath: 'assets/profile_pics/profile.png'),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: TextField(
                          controller: _commentController,
                          autofocus: true,
                          enableSuggestions: false,
                          decoration: const InputDecoration(
                            hintText: 'Add a comment...',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(4),
                        child: Icon(
                          Icons.gif_box_outlined,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
