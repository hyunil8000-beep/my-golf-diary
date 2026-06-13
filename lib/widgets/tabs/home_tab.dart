import 'package:flutter/material.dart';

import '../home/recommended_drills_section.dart';
import '../home/shot_tendency_section.dart';
import '../home/weekly_stats_card.dart';
import '../home/welcome_message_card.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
      children: const [
        WelcomeMessageCard(
          userName: '골퍼',
          focusTag: '슬라이스',
        ),
        SizedBox(height: 24),
        WeeklyStatsCard(
          practiceHours: 4,
          practiceMinutes: 30,
          totalShots: 320,
          weeklyGoalHours: 6,
        ),
        SizedBox(height: 28),
        ShotTendencySection(),
        SizedBox(height: 28),
        RecommendedDrillsSection(),
      ],
    );
  }
}
