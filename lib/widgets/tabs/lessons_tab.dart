import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class LessonsTab extends StatelessWidget {
  const LessonsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
      children: [
        Text(
          '레슨',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.primaryDark,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '프로 레슨 일정과 코칭 내용을 관리하세요.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: AppColors.primaryDark.withValues(alpha: 0.65),
          ),
        ),
        const SizedBox(height: 20),
        const _LessonCard(
          title: '원포인트 레슨',
          subtitle: '6월 15일 (일) 14:00 · 김프로',
          note: '슬라이스 교정 · 그립 점검',
        ),
        const SizedBox(height: 12),
        const _LessonCard(
          title: '드라이버 비거리 레슨',
          subtitle: '6월 22일 (일) 10:00 · 박프로',
          note: '체중 이동 · 임팩트 타이밍',
        ),
        const SizedBox(height: 12),
        _EmptyHintCard(
          message: '새 레슨 일정을 추가하면 이곳에 표시됩니다.',
        ),
      ],
    );
  }
}

class _LessonCard extends StatelessWidget {
  const _LessonCard({
    required this.title,
    required this.subtitle,
    required this.note,
  });

  final String title;
  final String subtitle;
  final String note;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.primary.withValues(alpha: 0.12),
              child: const Icon(Icons.school_outlined, color: AppColors.primary),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryDark,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    subtitle,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.primaryDark.withValues(alpha: 0.65),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    note,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: AppColors.primary),
          ],
        ),
      ),
    );
  }
}

class _EmptyHintCard extends StatelessWidget {
  const _EmptyHintCard({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(
              Icons.add_circle_outline,
              color: AppColors.primary.withValues(alpha: 0.7),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.primaryDark.withValues(alpha: 0.6),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
