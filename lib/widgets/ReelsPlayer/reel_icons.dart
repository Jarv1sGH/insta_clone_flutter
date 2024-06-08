import 'package:flutter/material.dart';

class ReelIcons extends StatefulWidget {
  const ReelIcons(
      {super.key,
      required this.icon,
      this.label,
      required this.onIconTap,
      this.iconColor});
  final IconData icon;
  final String? label;
  final Color? iconColor;
  final void Function() onIconTap;

  @override
  State<ReelIcons> createState() => _ReelIconsState();
}

class _ReelIconsState extends State<ReelIcons> {
  @override
  Widget build(BuildContext context) {
    // if (widget.icon == CustomIcons.heart) {}
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          InkWell(
            onTap: widget.onIconTap,
            child: Icon(
              widget.icon,
              color: widget.iconColor,
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
