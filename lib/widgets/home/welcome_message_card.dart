import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class WelcomeMessageCard extends StatelessWidget {
  const WelcomeMessageCard({
    super.key,
    this.userName = '골퍼',
    this.focusTag = '슬라이스',
  });

  final String userName;
  final String focusTag;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primary, AppColors.primaryLight],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.28),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.waving_hand_rounded,
                  color: Colors.white,
                  size: 22,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '오늘의 포커스',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: Colors.white.withValues(alpha: 0.9),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            '환영합니다, $userName님!',
            style: theme.textTheme.titleMedium?.copyWith(
              color: Colors.white.withValues(alpha: 0.88),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '오늘은 $focusTag를\n교정해볼까요?',
            style: theme.textTheme.headlineSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              height: 1.3,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '최근 연습 데이터를 바탕으로 맞춤 코칭을 준비했어요.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.white.withValues(alpha: 0.82),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
