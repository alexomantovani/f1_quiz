import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:f1_quiz/views/components/start_challenge_card_button.dart';
import 'package:f1_quiz/views/quiz_menu_view.dart';

void main() {
  testWidgets(
    'should display a Desafio Clássicos StartChallengeCardButton when QuizMenuView loads',
    (tester) async {
      await tester.pumpWidget(const MaterialApp(home: QuizMenuView()));
      final startChallengeCardButton = find.byWidgetPredicate((widget) =>
          startChallengePredicateMatcher(
              widget, 'challengeClassics', 'Desafio Clássicos'));

      expect(startChallengeCardButton, findsOneWidget);
    },
  );

  testWidgets(
    'should display a Desafio 2000\'s StartChallengeCardButton when QuizMenuView loads',
    (tester) async {
      await tester.pumpWidget(const MaterialApp(home: QuizMenuView()));
      final startChallengeCardButton = find.byWidgetPredicate((widget) =>
          startChallengePredicateMatcher(
              widget, 'challenge2000s', 'Desafio 2000\'s'));

      expect(startChallengeCardButton, findsOneWidget);
    },
  );
}

bool startChallengePredicateMatcher(
  Widget widget,
  String challengeTypeRoute,
  String challengeTypeTitle,
) {
  if (widget is StartChallengeCardButton) {
    return widget.challengeTypeRoute == challengeTypeRoute &&
        widget.challengeTypeTitle == challengeTypeTitle;
  }

  return false;
}
