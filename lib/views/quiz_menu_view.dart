import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/start_challenge_card_button.dart';

class QuizMenuView extends StatefulWidget {
  const QuizMenuView({Key? key}) : super(key: key);
  static const routeName = '/quizMenu.dart';

  @override
  State<QuizMenuView> createState() => _QuizMenuViewState();
}

class _QuizMenuViewState extends State<QuizMenuView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 207, 207),
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        title: const Text('QuizMenu'),
        backgroundColor: const Color(0xFFEE0000),
        centerTitle: true,
        toolbarHeight: 35.0,
        elevation: 0.0,
        leading: const SizedBox(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40.0,
            ),
            const Text(
              'Escolha seu \nmodo.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
            const SizedBox(
              height: 60.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                StartChallengeCardButton(
                  challengeTypeRoute: 'challengeClassics',
                  challengeTypeTitle: 'Desafio Clássicos',
                ),
                SizedBox(
                  height: 60.0,
                ),
                StartChallengeCardButton(
                  challengeTypeRoute: 'challenge2000s',
                  challengeTypeTitle: 'Desafio 2000\'s',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
