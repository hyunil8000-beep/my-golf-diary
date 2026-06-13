import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class ShotTendencyData {
  const ShotTendencyData({
    required this.tag,
    required this.percentage,
    required this.color,
  });

  final String tag;
  final double percentage;
  final Color color;
}

class ShotTendencySection extends StatelessWidget {
  const ShotTendencySection({
    super.key,
    this.tendencies = const [
      ShotTendencyData(tag: '슬라이스', percentage: 60, color: Color(0xFF066126)),
      ShotTendencyData(tag: '뒷땅', percentage: 20, color: Color(0xFF0A8A35)),
      ShotTendencyData(tag: '정타', percentage: 15, color: Color(0xFF4CAF50)),
      ShotTendencyData(tag: '탑볼', percentage: 5, color: Color(0xFF81C784)),
    ],
  });

  final List<ShotTendencyData> tendencies;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final topTag = tendencies.first;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '최근 나의 샷 경향',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.primaryDark,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          '지난 7일 연습 기록 기준',
          style: theme.textTheme.bodySmall?.copyWith(
            color: AppColors.primaryDark.withValues(alpha: 0.55),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _DonutChart(tendencies: tendencies),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '가장 많이 나온 구질',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: AppColors.primaryDark.withValues(alpha: 0.55),
                            ),
                          ),
                          const SizedBox(height: 6),
                          RichText(
                            text: TextSpan(
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.w800,
                                color: AppColors.primaryDark,
                              ),
                              children: [
                                TextSpan(text: topTag.tag),
                                TextSpan(
                                  text: ' ${topTag.percentage.round()}%',
                                  style: const TextStyle(color: AppColors.primary),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '최근 연습에서 반복되는 패턴이에요.\n추천 드릴로 교정해보세요.',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: AppColors.primaryDark.withValues(alpha: 0.6),
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 22),
                ...tendencies.map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _TendencyBar(item: item),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _DonutChart extends StatelessWidget {
  const _DonutChart({required this.tendencies});

  final List<ShotTendencyData> tendencies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 96,
      height: 96,
      child: CustomPaint(
        painter: _DonutChartPainter(tendencies: tendencies),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${tendencies.first.percentage.round()}%',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.primaryDark,
                ),
              ),
              Text(
                tendencies.first.tag,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppColors.primaryDark.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DonutChartPainter extends CustomPainter {
  _DonutChartPainter({required this.tendencies});

  final List<ShotTendencyData> tendencies;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    const strokeWidth = 12.0;
    var startAngle = -3.14159 / 2;

    for (final item in tendencies) {
      final sweepAngle = 2 * 3.14159 * (item.percentage / 100);
      final paint = Paint()
        ..color = item.color
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant _DonutChartPainter oldDelegate) {
    return oldDelegate.tendencies != tendencies;
  }
}

class _TendencyBar extends StatelessWidget {
  const _TendencyBar({required this.item});

  final ShotTendencyData item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: item.color,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              item.tag,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.primaryDark,
              ),
            ),
            const Spacer(),
            Text(
              '${item.percentage.round()}%',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(
            value: item.percentage / 100,
            minHeight: 8,
            backgroundColor: AppColors.primary.withValues(alpha: 0.08),
            color: item.color,
          ),
        ),
      ],
    );
  }
}
