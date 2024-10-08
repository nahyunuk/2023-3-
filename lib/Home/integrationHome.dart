import 'package:flutter/material.dart';
import 'package:pratice_2023_3/Home/bottunNavigationBar.dart';
import 'package:pratice_2023_3/Home/bakyungage.dart';
import 'package:pratice_2023_3/Home/mainHome.dart';
import 'package:pratice_2023_3/Home/searchPage.dart';
import 'package:pratice_2023_3/Home/likePage.dart';
import 'package:pratice_2023_3/Home/settingPage.dart';
class IntegrationHome extends StatefulWidget {
  const IntegrationHome({super.key});

  @override
  State<IntegrationHome> createState() => _IntegrationHomeState();
}

class _IntegrationHomeState extends State<IntegrationHome> {
  int _currentIndex = 0; // 현재 선택된 탭의 인덱스

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _getSelectedPage(_currentIndex), // 현재 선택된 페이지에 맞는 위젯 표시
      ),
      bottomNavigationBar: BottunnavigationBar(
        currentIndex: _currentIndex,
        onTabSelected: _onTabSelected,
      ), // 분리된 파일에서 BottomNavigationBar 사용
    );
  }

  Widget _getSelectedPage(int index) {
    switch (index) {
      case 0:
        return Mainhome();
      case 1:
        return Bakyungage();
      case 2:
        return SearchPage();
      case 3:
        return LikePage();
      case 4:
        return SettingPage();
      default:
        return Text('Unknown Page');
    }
  }
}
