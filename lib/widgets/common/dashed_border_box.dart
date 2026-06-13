import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class DashedBorderBox extends StatelessWidget {
  const DashedBorderBox({
    super.key,
    required this.onTap,
    required this.icon,
    required this.label,
    this.subtitle,
  });

  final VoidCallback onTap;
  final IconData icon;
  final String label;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: CustomPaint(
          painter: _DashedRectPainter(
            color: AppColors.primary.withValues(alpha: 0.35),
            radius: 16,
          ),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.08),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: AppColors.primary, size: 26),
                ),
                const SizedBox(height: 12),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryDark,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle!,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.primaryDark.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DashedRectPainter extends CustomPainter {
  _DashedRectPainter({required this.color, required this.radius});

  final Color color;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          Radius.circular(radius),
        ),
      );

    const dashWidth = 6.0;
    const dashSpace = 5.0;

    for (final metric in path.computeMetrics()) {
      var distance = 0.0;
      while (distance < metric.length) {
        final next = distance + dashWidth;
        canvas.drawPath(
          metric.extractPath(distance, next.clamp(0, metric.length)),
          paint,
        );
        distance = next + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DashedRectPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.radius != radius;
  }
}
