import 'package:flutter/material.dart';

import '../widgets/tabs/home_tab.dart';
import '../widgets/tabs/lessons_tab.dart';
import '../widgets/tabs/practice_tab.dart';
import '../widgets/tabs/rounds_tab.dart';
import '../widgets/tabs/swing_analysis_tab.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  static const _tabs = <Widget>[
    HomeTab(),
    PracticeTab(),
    SwingAnalysisTab(),
    LessonsTab(),
    RoundsTab(),
  ];

  static const _titles = ['홈', '연습 기록', '스윙 분석', '레슨', '라운드'];

  static const _destinations = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home),
      label: '홈',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.edit_note_outlined),
      activeIcon: Icon(Icons.edit_note),
      label: '연습',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.analytics_outlined),
      activeIcon: Icon(Icons.analytics),
      label: '스윙',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.school_outlined),
      activeIcon: Icon(Icons.school),
      label: '레슨',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.flag_outlined),
      activeIcon: Icon(Icons.flag),
      label: '라운드',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: _destinations,
      ),
    );
  }
}
