import 'package:flutter/material.dart';
import 'package:insta_clone/models/post_model.dart';
import 'package:insta_clone/widgets/FYP/fyp_row.dart';
import 'package:insta_clone/data/fyp_data.dart';

class ForYouScreen extends StatelessWidget {
  const ForYouScreen({super.key, required this.updateIsPressed});
  final Function({
    required bool isPressed,
    required PostModel post,
    required bool isReel,
  }) updateIsPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 60,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.black38),
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: fypData.length,
                  itemBuilder: (context, index) {
                    return FypRow(
                        index: index,
                        rowData: fypData[index],
                        updateIsPressed: updateIsPressed);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
