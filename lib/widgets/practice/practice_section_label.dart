import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class PracticeSectionLabel extends StatelessWidget {
  const PracticeSectionLabel({
    super.key,
    required this.title,
    this.subtitle,
  });

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.primaryDark,
            letterSpacing: -0.2,
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 4),
          Text(
            subtitle!,
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppColors.primaryDark.withValues(alpha: 0.55),
              height: 1.4,
            ),
          ),
        ],
      ],
    );
  }
}
