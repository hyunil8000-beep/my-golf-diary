import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class SwingAnalysisTab extends StatelessWidget {
  const SwingAnalysisTab({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
      children: [
        Text(
          '스윙 분석',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.primaryDark,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '스윙 영상과 데이터를 기반으로 개선 포인트를 확인하세요.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: AppColors.primaryDark.withValues(alpha: 0.65),
          ),
        ),
        const SizedBox(height: 20),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.analytics_outlined,
                        color: AppColors.primary,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '최근 분석',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryDark,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '백스윙 각도 · 템포 · 임팩트 타이밍',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: AppColors.primaryDark.withValues(alpha: 0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const _MetricRow(label: '클럽 헤드 스피드', value: '42 m/s'),
                const SizedBox(height: 12),
                const _MetricRow(label: '스윙 템포', value: '3 : 1'),
                const SizedBox(height: 12),
                const _MetricRow(label: '개선 포인트', value: '하체 회전 강화'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.videocam_outlined),
            label: const Text('스윙 영상 업로드'),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.primary,
              side: const BorderSide(color: AppColors.primary),
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _MetricRow extends StatelessWidget {
  const _MetricRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: AppColors.primaryDark.withValues(alpha: 0.7),
          ),
        ),
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
