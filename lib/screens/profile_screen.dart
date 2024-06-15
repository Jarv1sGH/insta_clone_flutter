import 'package:flutter/material.dart';
import 'package:insta_clone/custom_icons_icons.dart';
import 'package:insta_clone/widgets/profile_picture.dart';
import 'package:insta_clone/widgets/profile_screen/profile_actions.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  final TextStyle profileTextStyle =
      const TextStyle(fontWeight: FontWeight.w500);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              title: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 4),
                    child: Icon(
                      Icons.lock,
                      size: 16,
                    ),
                  ),
                  Text(
                    'auroramusic',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CustomIcons.addSquare,
                    size: 28,
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu,
                      size: 28,
                    )),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 3,
                  child: SizedBox(
                    child: Center(
                      child: Column(
                        children: [
                          ProfilePicture(
                            imageWidth: 80,
                            imageHeight: 80,
                            imagePath: 'assets/profile_pics/profile.png',
                          ),
                          Text(
                            'auroramusic',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'Bio goes here',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Row(
                          children: List.generate(3, (index) {
                        return Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Text('0', style: profileTextStyle),
                              Text(
                                  index == 0
                                      ? 'posts'
                                      : index == 1
                                          ? 'followers'
                                          : 'following',
                                  style: profileTextStyle)
                            ],
                          ),
                        );
                      })),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const ProfileActions(
                  actionName: 'Edit Profile',
                  paddingLeft: 8,
                ),
                const ProfileActions(
                  actionName: 'Share Profile',
                  paddingLeft: 4,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4, right: 8),
                  child: Container(
                    width: 40,
                    height: 30,
                    decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
                    ),
                    child: const Center(
                      child: Icon(Icons.person_add),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(99999)),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            size: 32,
                          ),
                        ),
                      ),
                      const Text('New')
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: List.generate(3, (index) {
                return Expanded(
                    flex: 1,
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(width: 0.2)),
                      ),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Icon(
                          size: 28,
                          index == 0
                              ? Icons.grid_on_sharp
                              : index == 1
                                  ? CustomIcons.reels
                                  : Icons.person_pin_outlined,
                        ),
                      )),
                    ));
              }),
            ),
            SizedBox(
              width: double.infinity,
              height: 625,
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  const Text(
                    'Capture the moment with a friend',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Create your first post',
                    style: TextStyle(color: Colors.blue[400]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
