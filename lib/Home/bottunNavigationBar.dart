import 'package:flutter/material.dart';
class BottunnavigationBar extends StatefulWidget {
  final Function(int) onTabSelected;
  final int currentIndex;

  const BottunnavigationBar({super.key,required this.onTabSelected, required this.currentIndex});

  @override
  State<BottunnavigationBar> createState() => _BottunnavigationBarState();
}

class _BottunnavigationBarState extends State<BottunnavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.blueAccent,
      onTap: widget.onTabSelected,
      currentIndex: widget.currentIndex,
      iconSize: 35.0,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(0.5),
      selectedFontSize:16 ,
      unselectedFontSize: 16,


      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/home.png',height: 25,width: 25,),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category_outlined),
          label: '백년가게',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: '검색',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border_outlined),
          label: '좋아요',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_outlined),
          label: '설정',
        ),
      ],
    );
  }
}
