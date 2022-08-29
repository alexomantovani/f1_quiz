import '/views/quiz_menu_view.dart';
import 'package:flutter/material.dart';

class QuizIntroView extends StatelessWidget {
  const QuizIntroView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: (size.height * 0.312).roundToDouble(),
              height: (size.width * 0.555).roundToDouble(),
              child: Image.asset(
                'lib/assets/formula-1.png',
                fit: BoxFit.contain,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, QuizMenuView.routeName);
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFFEE0000),
              ),
              child: const Text(
                'Desafio aceito!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
