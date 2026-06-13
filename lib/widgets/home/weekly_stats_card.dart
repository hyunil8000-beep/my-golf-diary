import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class WeeklyStatsCard extends StatelessWidget {
  const WeeklyStatsCard({
    super.key,
    this.practiceHours = 4,
    this.practiceMinutes = 30,
    this.totalShots = 320,
    this.weeklyGoalHours = 6,
  });

  final int practiceHours;
  final int practiceMinutes;
  final int totalShots;
  final int weeklyGoalHours;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final totalMinutes = practiceHours * 60 + practiceMinutes;
    final goalMinutes = weeklyGoalHours * 60;
    final progress = (totalMinutes / goalMinutes).clamp(0.0, 1.0);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '이번 주 누적 연습량',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryDark,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '6월 2주차',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: _StatBlock(
                    icon: Icons.schedule_rounded,
                    label: '연습 시간',
                    value: '${practiceHours}h ${practiceMinutes}m',
                    progress: progress,
                    progressLabel: '주간 목표 ${weeklyGoalHours}h',
                  ),
                ),
                Container(
                  width: 1,
                  height: 88,
                  margin: const EdgeInsets.symmetric(horizontal: 18),
                  color: AppColors.primary.withValues(alpha: 0.1),
                ),
                Expanded(
                  child: _StatBlock(
                    icon: Icons.sports_golf_rounded,
                    label: '총 타수',
                    value: '$totalShots',
                    valueSuffix: '타',
                    progress: (totalShots / 400).clamp(0.0, 1.0),
                    progressLabel: '목표 400타',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 8,
                backgroundColor: AppColors.primary.withValues(alpha: 0.08),
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '주간 목표의 ${(progress * 100).round()}% 달성',
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.primaryDark.withValues(alpha: 0.55),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatBlock extends StatelessWidget {
  const _StatBlock({
    required this.icon,
    required this.label,
    required this.value,
    required this.progress,
    required this.progressLabel,
    this.valueSuffix,
  });

  final IconData icon;
  final String label;
  final String value;
  final String? valueSuffix;
  final double progress;
  final String progressLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 18, color: AppColors.primary),
            const SizedBox(width: 6),
            Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.primaryDark.withValues(alpha: 0.6),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              value,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w800,
                color: AppColors.primaryDark,
                letterSpacing: -0.5,
              ),
            ),
            if (valueSuffix != null) ...[
              const SizedBox(width: 4),
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  valueSuffix!,
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: AppColors.primaryDark.withValues(alpha: 0.45),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: 52,
          height: 52,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 52,
                height: 52,
                child: CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 5,
                  backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                  color: AppColors.primary,
                ),
              ),
              Text(
                '${(progress * 100).round()}%',
                style: theme.textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Text(
          progressLabel,
          style: theme.textTheme.labelSmall?.copyWith(
            color: AppColors.primaryDark.withValues(alpha: 0.45),
          ),
        ),
      ],
    );
  }
}
