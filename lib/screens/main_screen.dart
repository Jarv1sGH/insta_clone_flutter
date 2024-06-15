import 'package:flutter/material.dart';
import 'package:insta_clone/custom_icons_icons.dart';
import 'package:insta_clone/screens/create_post_screen.dart';
import 'package:insta_clone/screens/fyp.dart';
import 'package:insta_clone/screens/home_screen.dart';
import 'package:insta_clone/screens/profile_screen.dart';
import 'package:insta_clone/screens/reels_screen.dart';
import 'package:insta_clone/widgets/FYP/fyp_wrapper.dart';
import 'package:insta_clone/widgets/profile_picture.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const FypWrapper(),
    const CreatePostScreen(),
    ReelsScreen(),
    const ProfileScreen()
  ];

  void onNavIconTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Icon(
                Icons.home_filled,
                color: Colors.black,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Icon(
                CustomIcons.addSquare,
                color: Colors.black,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Icon(
                CustomIcons.reels,
                color: Colors.black,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 10),
              child: ProfilePicture(
                imageWidth: 30,
                imageHeight: 30,
                imagePath: 'assets/profile_pics/profile.png',
              ),
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: onNavIconTap,
        selectedItemColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
      ),
    );
  }
}
