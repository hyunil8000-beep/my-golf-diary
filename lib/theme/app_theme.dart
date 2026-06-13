import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppTheme {
  static ThemeData get light {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
      brightness: Brightness.light,
      surface: AppColors.surfaceTint,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.surfaceTint,
      appBarTheme: AppBarTheme(
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.surfaceTint,
        foregroundColor: AppColors.primaryDark,
        titleTextStyle: const TextStyle(
          color: AppColors.primaryDark,
          fontSize: 22,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.3,
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        elevation: 0,
        height: 72,
        backgroundColor: AppColors.cardBackground,
        indicatorColor: AppColors.primary.withValues(alpha: 0.12),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            );
          }
          return TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryDark.withValues(alpha: 0.55),
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: AppColors.primary, size: 24);
          }
          return IconThemeData(
            color: AppColors.primaryDark.withValues(alpha: 0.45),
            size: 24,
          );
        }),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        backgroundColor: AppColors.cardBackground,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.primaryDark.withValues(alpha: 0.45),
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: AppColors.cardBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: AppColors.primary.withValues(alpha: 0.08),
          ),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
    );
  }
}
