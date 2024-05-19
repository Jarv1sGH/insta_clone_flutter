import 'package:flutter/material.dart';
import 'package:insta_clone/widgets/mediaCarousel/page_indicator.dart';

class MediaCarousel extends StatefulWidget {
  const MediaCarousel(
      {super.key, required this.mediaLength, required this.imgList});
  final int mediaLength;
  final List<String> imgList;
  @override
  State<MediaCarousel> createState() => _MediaCarouselState();
}

class _MediaCarouselState extends State<MediaCarousel>
    with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: widget.mediaLength, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  void _handleSwipe(int currentIndex) {
    _tabController.index = currentIndex;
    setState(() {
      _currentPageIndex = currentIndex;
    });
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 400,
          child: PageView(
            controller: _pageViewController,
            onPageChanged: _handleSwipe,
            children: [
              ...widget.imgList.map((e) => Image.asset(e, fit: BoxFit.cover)),
            ],
          ),
        ),
        PageIndicator(
          tabController: _tabController,
          currentPageIndex: _currentPageIndex,
          onUpdateCurrentPageIndex: _updateCurrentPageIndex,
        ),
      ],
    );
  }
}
