import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:guess_the_number_game/main.dart';

void main() {
  testWidgets('Тест увеличения счетчика', (WidgetTester tester) async {
    // ! Строим наше приложение и запускаем фрейм.
    await tester.pumpWidget(const MyApp());

    // ! Проверяем, что наш счетчик начинается с 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // ! Нажимаем на иконку '+' и запускаем фрейм.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // ! Проверяем, что наш счетчик увеличился.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
