import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class RecommendedDrill {
  const RecommendedDrill({
    required this.title,
    required this.description,
    required this.duration,
    required this.icon,
    required this.gradientColors,
  });

  final String title;
  final String description;
  final String duration;
  final IconData icon;
  final List<Color> gradientColors;
}

class RecommendedDrillsSection extends StatelessWidget {
  const RecommendedDrillsSection({
    super.key,
    this.drills = const [
      RecommendedDrill(
        title: '투 도어 드릴',
        description: '슬라이스 교정을 위한 스윙 패스 연습',
        duration: '15분',
        icon: Icons.door_sliding_outlined,
        gradientColors: [Color(0xFF066126), Color(0xFF0A8A35)],
      ),
      RecommendedDrill(
        title: '3-3-3 템포',
        description: '백스윙·다운·팔로우 리듬감 훈련',
        duration: '10분',
        icon: Icons.timer_outlined,
        gradientColors: [Color(0xFF044A1A), Color(0xFF066126)],
      ),
      RecommendedDrill(
        title: '티 높이 조절',
        description: '탑볼 방지를 위한 어드레스 연습',
        duration: '12분',
        icon: Icons.height_outlined,
        gradientColors: [Color(0xFF0A8A35), Color(0xFF4CAF50)],
      ),
    ],
  });

  final List<RecommendedDrill> drills;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '추천 드릴',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.primaryDark,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: const Text('전체 보기'),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          '샷 경향에 맞춘 맞춤 연습 루틴',
          style: theme.textTheme.bodySmall?.copyWith(
            color: AppColors.primaryDark.withValues(alpha: 0.55),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 220,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: drills.length,
            separatorBuilder: (context, index) => const SizedBox(width: 14),
            itemBuilder: (context, index) {
              return RecommendedDrillCard(drill: drills[index]);
            },
          ),
        ),
      ],
    );
  }
}

class RecommendedDrillCard extends StatelessWidget {
  const RecommendedDrillCard({super.key, required this.drill});

  final RecommendedDrill drill;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: 200,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 110,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: drill.gradientColors,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: -10,
                    bottom: -10,
                    child: Icon(
                      drill.icon,
                      size: 72,
                      color: Colors.white.withValues(alpha: 0.18),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        drill.icon,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        drill.duration,
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      drill.title,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryDark,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      drill.description,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.primaryDark.withValues(alpha: 0.6),
                        height: 1.4,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
