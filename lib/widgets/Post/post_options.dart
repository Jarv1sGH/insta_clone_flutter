import 'package:flutter/material.dart';
import 'package:insta_clone/custom_icons_icons.dart';
import 'package:insta_clone/widgets/Post/post_option_icon.dart';

class PostOptions extends StatelessWidget {
  PostOptions({super.key});
  final List<Map<String, dynamic>> options = [
    {'icon': Icons.info_outline, 'label': 'Why you\'re seeing this post'},
    {'icon': Icons.hide_image_outlined, 'label': 'Hide'},
    {'icon': Icons.person, 'label': 'About this account'},
    {'icon': Icons.report_gmailerrorred, 'label': 'Report'},
  ];
  @override
  Widget build(BuildContext context) {
    final Color _borderColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;
    return Column(
      children: [
        const SizedBox(
          width: double.infinity,
          child: Center(
              child: Icon(
            Icons.horizontal_rule_rounded,
            size: 50,
          )),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 0.1, color: _borderColor),
            ),
          ),
          child: Row(
            children: [
              PostOptionIcon(
                icon: CustomIcons.save,
                iconText: 'Save',
                borderColor: _borderColor,
              ),
              PostOptionIcon(
                icon: Icons.qr_code_scanner,
                iconText: 'QR code',
                borderColor: _borderColor,
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 0.05, color: _borderColor),
            ),
          ),
          child: Column(
            children: [
              ...List.generate(2, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Icon(
                          index == 0 ? Icons.star_border : Icons.person_remove,
                          size: 28,
                        ),
                      ),
                      Text(index == 0 ? 'Add to favourites' : 'Unfollow')
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
        Column(
          children: [
            ...options.map((option) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Icon(
                        color: option['label'] == 'Report' ? Colors.red : null,
                        option['icon'],
                        size: 28,
                      ),
                    ),
                    Text(
                      option['label'],
                      style: TextStyle(
                        color: option['label'] == 'Report' ? Colors.red : null,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        )
      ],
    );
  }
}
