import 'package:flutter/material.dart';

class PostOptionIcon extends StatelessWidget {
  const PostOptionIcon(
      {super.key,
      required this.icon,
      required this.iconText,
      required this.borderColor});

  final IconData icon;
  final String iconText;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Center(
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: borderColor),
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Icon(
                  icon,
                  size: 35,
                ),
              ),
            ),
            Text(iconText)
          ],
        ),
      ),
    );
  }
}
