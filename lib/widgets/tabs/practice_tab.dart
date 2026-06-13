import 'package:flutter/material.dart';

import '../../screens/practice_record_screen.dart';
import '../../theme/app_colors.dart';

class PracticeTab extends StatelessWidget {
  const PracticeTab({super.key});

  void _openRecordScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => const PracticeRecordScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
      children: [
        Text(
          '연습 기록',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.primaryDark,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '드라이버, 아이언, 퍼팅 등 세션별 연습 내용을 기록하세요.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: AppColors.primaryDark.withValues(alpha: 0.65),
          ),
        ),
        const SizedBox(height: 20),
        _NewRecordButton(onTap: () => _openRecordScreen(context)),
        const SizedBox(height: 20),
        _PracticeRecordCard(
          date: '2026.06.12',
          title: '드라이버 연습',
          detail: '비거리 · 방향성 집중 · 60분',
          onTap: () => _openRecordScreen(context),
        ),
        const SizedBox(height: 12),
        _PracticeRecordCard(
          date: '2026.06.10',
          title: '숏게임 & 퍼팅',
          detail: '10m 이내 · 45분',
          onTap: () => _openRecordScreen(context),
        ),
      ],
    );
  }
}

class _NewRecordButton extends StatelessWidget {
  const _NewRecordButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primary,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 22),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '새 연습 기록 작성',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '클럽, 타수, 구질, 영상, 메모까지 한 번에',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _PracticeRecordCard extends StatelessWidget {
  const _PracticeRecordCard({
    required this.date,
    required this.title,
    required this.detail,
    required this.onTap,
  });

  final String date;
  final String title;
  final String detail;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: AppColors.primary.withValues(alpha: 0.12),
          child: const Icon(Icons.edit_note, color: AppColors.primary),
        ),
        title: Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.primaryDark,
          ),
        ),
        subtitle: Text('$date · $detail'),
        trailing: const Icon(Icons.chevron_right, color: AppColors.primary),
      ),
    );
  }
}
