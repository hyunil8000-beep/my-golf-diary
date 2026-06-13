import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class RoundsTab extends StatelessWidget {
  const RoundsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
      children: [
        Text(
          '라운드',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.primaryDark,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '라운드 기록과 스코어를 한곳에서 확인하세요.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: AppColors.primaryDark.withValues(alpha: 0.65),
          ),
        ),
        const SizedBox(height: 20),
        const Row(
          children: [
            Expanded(
              child: _RoundStatCard(
                label: '평균 스코어',
                value: '91',
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _RoundStatCard(
                label: '최근 라운드',
                value: '94',
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const _RoundCard(
          title: '스카이72 CC',
          subtitle: '6월 8일 · 18홀 · 맑음',
          score: '94',
        ),
        const SizedBox(height: 12),
        const _RoundCard(
          title: '레이크사이드 GC',
          subtitle: '5월 31일 · 18홀 · 흐림',
          score: '89',
        ),
        const SizedBox(height: 12),
        _EmptyHintCard(
          message: '새 라운드 기록을 추가하면 이곳에 표시됩니다.',
        ),
      ],
    );
  }
}

class _RoundStatCard extends StatelessWidget {
  const _RoundStatCard({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.primaryDark.withValues(alpha: 0.6),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w800,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RoundCard extends StatelessWidget {
  const _RoundCard({
    required this.title,
    required this.subtitle,
    required this.score,
  });

  final String title;
  final String subtitle;
  final String score;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.primary.withValues(alpha: 0.12),
              child: const Icon(Icons.flag_outlined, color: AppColors.primary),
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
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                score,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.primary,
                ),
              ),
            ),
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
