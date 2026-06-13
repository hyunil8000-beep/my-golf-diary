import 'package:flutter_test/flutter_test.dart';

import 'package:my_golf_diary/main.dart';

void main() {
  testWidgets('My Golf Diary shows home tab', (WidgetTester tester) async {
    await tester.pumpWidget(const MyGolfDiaryApp());

    expect(find.textContaining('환영합니다'), findsOneWidget);
    expect(find.text('홈'), findsWidgets);
  });
}
