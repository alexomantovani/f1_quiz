import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:f1_quiz/views/quiz_intro_view.dart';

void main() {
  testWidgets(
    'should display the main Formula 1 logo image when intro view is loaded',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: QuizIntroView()));
      final formulaOneLogo = find.byType(Image);
      expect(formulaOneLogo, findsOneWidget);
    },
  );

  testWidgets(
    'should display an ElevatedButton Desafio Aceito! at the bottom of the screen',
    (tester) async {
      await tester.pumpWidget(const MaterialApp(home: QuizIntroView()));

      final elevatedButton =
          find.widgetWithText(ElevatedButton, 'Desafio aceito!');
      expect(elevatedButton, findsOneWidget);
    },
  );
}
