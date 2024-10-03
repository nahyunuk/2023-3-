import 'package:flutter/material.dart';
import 'package:pratice_2023_3/Start/backup.dart';
import 'package:pratice_2023_3/Start/introduce.dart';
import 'package:pratice_2023_3/Start/simbol.dart';

class Pageview extends StatefulWidget {
  const Pageview({super.key});

  @override
  State<Pageview> createState() => _PageviewState();
}

class _PageviewState extends State<Pageview> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            if (index == 4) {
              _pageController.jumpToPage(1);
            }
            if (index == 0) {
              _pageController.jumpToPage(3);
            }
          });
        },
        children: [
          Backup(),
          Simbol(pageController: _pageController),
          Introduce(pageController: _pageController),
          Backup(),
          Simbol(pageController: _pageController),
        ],
      ),
    );
  }
}
