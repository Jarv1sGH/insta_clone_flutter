import 'package:flutter/material.dart';

class ReelIcons extends StatelessWidget {
  const ReelIcons({
    super.key,
    required this.icon,
    this.label,
  });
  final IconData icon;
  final String? label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 28,
          ),
          const SizedBox(
            height: 4,
          ),
          if (label != null)
            Text(
              label!,
              style: const TextStyle(color: Colors.white),
            ),
        ],
      ),
    );
  }
}
