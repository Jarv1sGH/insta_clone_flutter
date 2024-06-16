import 'package:flutter/material.dart';

class CaptionRow extends StatelessWidget {
  const CaptionRow({
    super.key,
    required this.caption,
    required this.time,
    required this.username,
    required this.showComments,
  });
  final String username;
  final String caption;
  final String time;
  final void Function() showComments;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(TextSpan(children: [
                  TextSpan(
                    text: '$username ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: caption,
                  )
                ])),
                InkWell(
                    onTap: () {},
                    child: InkWell(
                      onTap: showComments,
                      child: Text(
                        'View all comments',
                        style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black54,
                        ),
                      ),
                    )),
                InkWell(
                  onTap: () {},
                  child: Text(
                    time,
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
