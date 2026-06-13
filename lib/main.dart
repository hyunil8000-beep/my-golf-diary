import 'package:flutter/material.dart';

import 'screens/main_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyGolfDiaryApp());
}

class MyGolfDiaryApp extends StatelessWidget {
  const MyGolfDiaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Golf Diary',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const MainScreen(),
    );
  }
}
