import 'package:flutter/material.dart';
import 'package:insta_clone/custom_icons_icons.dart';

class ReelIcons extends StatefulWidget {
  const ReelIcons({
    super.key,
    required this.icon,
    this.label,
  });
  final IconData icon;
  final String? label;

  @override
  State<ReelIcons> createState() => _ReelIconsState();
}

class _ReelIconsState extends State<ReelIcons> {
  @override
  Widget build(BuildContext context) {
    if (widget.icon == CustomIcons.heart) {}
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            child: Icon(
              widget.icon,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          if (widget.label != null)
            Text(
              widget.label!,
              style: const TextStyle(color: Colors.white),
            ),
        ],
      ),
    );
  }
}
