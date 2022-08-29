import 'package:flutter/material.dart';

import '../quiz_cards_view.dart';

class StartChallengeCardButton extends StatelessWidget {
  const StartChallengeCardButton({
    Key? key,
    required this.challengeTypeRoute,
    required this.challengeTypeTitle,
  }) : super(key: key);

  final String challengeTypeRoute;
  final String challengeTypeTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, QuizCardsView.routeName,
            arguments: challengeTypeRoute);
      },
      child: Container(
        width: 150.0,
        height: 260.0,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 63, 63),
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Icon(
                  Icons.videogame_asset_rounded,
                  color: Colors.white,
                  size: 60.0,
                ),
              ],
            ),
            Text(
              challengeTypeTitle,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Jogue Sozinho',
              style: TextStyle(
                color: Colors.grey.shade100,
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 30.0,
            )
          ],
        ),
      ),
    );
  }
}
