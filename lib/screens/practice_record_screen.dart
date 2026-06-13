import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/app_colors.dart';
import '../widgets/common/dashed_border_box.dart';
import '../widgets/practice/practice_section_label.dart';

class PracticeRecordScreen extends StatefulWidget {
  const PracticeRecordScreen({super.key});

  @override
  State<PracticeRecordScreen> createState() => _PracticeRecordScreenState();
}

class _PracticeRecordScreenState extends State<PracticeRecordScreen> {
  static const _clubs = [
    '드라이버',
    '3W',
    '5W',
    '4I',
    '5I',
    '6I',
    '7I',
    '8I',
    '9I',
    'PW',
    'AW',
    'SW',
    'LW',
    '퍼터',
  ];

  static const _shotTags = [
    '슬라이스',
    '훅',
    '뒷땅',
    '탑볼',
    '정타',
    '푸시',
    '풀',
  ];

  DateTime _selectedDate = DateTime.now();
  String? _selectedClub;
  final Set<String> _selectedTags = {};
  final TextEditingController _shotCountController = TextEditingController();
  final TextEditingController _memoController = TextEditingController();

  @override
  void dispose() {
    _shotCountController.dispose();
    _memoController.dispose();
    super.dispose();
  }

  String _formatDate(DateTime date) {
    const weekdays = ['월', '화', '수', '목', '금', '토', '일'];
    return '${date.year}년 ${date.month}월 ${date.day}일 '
        '(${weekdays[date.weekday - 1]})';
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: AppColors.primary,
              onPrimary: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  InputDecoration _inputDecoration({
    required String hintText,
    Widget? suffix,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
        color: AppColors.primaryDark.withValues(alpha: 0.35),
      ),
      filled: true,
      fillColor: AppColors.cardBackground,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      suffix: suffix,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: AppColors.primary.withValues(alpha: 0.1),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: AppColors.primary.withValues(alpha: 0.1),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.surfaceTint,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('연습 기록 입력'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _HeaderSection(
                    formattedDate: _formatDate(_selectedDate),
                    onCalendarTap: _pickDate,
                  ),
                  const SizedBox(height: 32),
                  const PracticeSectionLabel(
                    title: '연습 클럽',
                    subtitle: '오늘 집중적으로 연습한 클럽을 선택하세요',
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 44,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: _clubs.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 10),
                      itemBuilder: (context, index) {
                        final club = _clubs[index];
                        final isSelected = _selectedClub == club;

                        return FilterChip(
                          label: Text(club),
                          selected: isSelected,
                          showCheckmark: false,
                          onSelected: (_) {
                            setState(() => _selectedClub = club);
                          },
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: isSelected
                                ? Colors.white
                                : AppColors.primaryDark.withValues(alpha: 0.75),
                          ),
                          backgroundColor: AppColors.cardBackground,
                          selectedColor: AppColors.primary,
                          side: BorderSide(
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.primary.withValues(alpha: 0.12),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 32),
                  const PracticeSectionLabel(
                    title: '샷 데이터',
                    subtitle: '오늘 연습한 총 타수를 입력하세요',
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _shotCountController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryDark,
                    ),
                    decoration: _inputDecoration(
                      hintText: '0',
                      suffix: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          '타',
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: AppColors.primaryDark.withValues(alpha: 0.45),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  const PracticeSectionLabel(
                    title: '샷 경향성',
                    subtitle: '느껴진 구질이나 문제점을 복수 선택하세요',
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: _shotTags.map((tag) {
                      final isSelected = _selectedTags.contains(tag);

                      return FilterChip(
                        label: Text(tag),
                        selected: isSelected,
                        showCheckmark: false,
                        onSelected: (_) {
                          setState(() {
                            if (isSelected) {
                              _selectedTags.remove(tag);
                            } else {
                              _selectedTags.add(tag);
                            }
                          });
                        },
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.primaryDark.withValues(alpha: 0.7),
                        ),
                        backgroundColor: AppColors.cardBackground,
                        selectedColor: AppColors.primary.withValues(alpha: 0.12),
                        side: BorderSide(
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.primary.withValues(alpha: 0.12),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 32),
                  const PracticeSectionLabel(
                    title: '스윙 영상',
                    subtitle: '측면·정면 영상을 추가하면 스윙 분석에 활용됩니다',
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: DashedBorderBox(
                          icon: Icons.video_camera_back_outlined,
                          label: '측면 영상 추가',
                          subtitle: 'Side View',
                          onTap: () {},
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: DashedBorderBox(
                          icon: Icons.videocam_outlined,
                          label: '정면 영상 추가',
                          subtitle: 'Front View',
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  const PracticeSectionLabel(
                    title: '메모',
                    subtitle: '오늘의 느낌 및 레슨 내용',
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _memoController,
                    minLines: 6,
                    maxLines: 10,
                    textAlignVertical: TextAlignVertical.top,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: AppColors.primaryDark,
                      height: 1.6,
                    ),
                    decoration: _inputDecoration(
                      hintText: '스윙 느낌, 프로 코멘트, 개선 포인트 등을 자유롭게 기록하세요.',
                    ),
                  ),
                ],
              ),
            ),
          ),
          _SaveBar(onSave: () {}),
        ],
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection({
    required this.formattedDate,
    required this.onCalendarTap,
  });

  final String formattedDate;
  final VoidCallback onCalendarTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.08),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.06),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '오늘의 연습',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.primaryDark,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  formattedDate,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Material(
            color: AppColors.primary.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(14),
            child: InkWell(
              onTap: onCalendarTap,
              borderRadius: BorderRadius.circular(14),
              child: const Padding(
                padding: EdgeInsets.all(12),
                child: Icon(
                  Icons.calendar_month_outlined,
                  color: AppColors.primary,
                  size: 26,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SaveBar extends StatelessWidget {
  const _SaveBar({required this.onSave});

  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        24,
        16,
        24,
        16 + MediaQuery.paddingOf(context).bottom,
      ),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        height: 54,
        child: FilledButton(
          onPressed: onSave,
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: const Text(
            '연습 기록 저장',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.2,
            ),
          ),
        ),
      ),
    );
  }
}
