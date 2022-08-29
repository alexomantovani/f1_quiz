import 'dart:math';

import 'package:flutter/material.dart';
import '/views/components/red_card.dart';

import '../../controllers/home_controller.dart';

class AnimatedCardBuilder extends StatelessWidget {
  const AnimatedCardBuilder({
    Key? key,
    required PageController pageController,
    required this.index,
    required this.isLoaded,
    required this.controller,
    required this.size,
    required this.questions,
    required this.answerCheck,
    required this.answerChecked,
  })  : _pageController = pageController,
        super(key: key);
  final ValueNotifier answerCheck;
  final ValueNotifier answerChecked;
  final int index;
  final PageController _pageController;
  final bool isLoaded;
  final HomeController controller;
  final Size? size;
  final List<String>? questions;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double xRotationValue = 1.0;
        double yValue = 0.0;

        if (_pageController.position.haveDimensions) {
          xRotationValue = _pageController.page! - index;

          if (xRotationValue >= 0) {
            double lowerLimit = 0;
            double upperLimit = pi / 2;

            xRotationValue = (upperLimit -
                    (xRotationValue.abs() * (upperLimit - lowerLimit)))
                .clamp(lowerLimit, upperLimit);
            xRotationValue = upperLimit - xRotationValue;
            xRotationValue *= -1;
          }
        } else {
          if (index == 0) {
            xRotationValue = 0.0;
            yValue = 0.0;
          } else if (index == 1) {
            xRotationValue = -1;
            yValue = -60.0;
          } else {
            yValue = -100.0;
          }
        }

        return isLoaded
            ? RedCard(
                controller.canadianGP1992Results,
                controller.prostTitlesResults,
                controller.sennaMonacoVictoriesResults,
                controller.championsResults,
                controller.finishing1976StatusResults,
                controller.massasFinishedRacesForFerrariResults,
                controller.vettelsFirstTitleAgeResults,
                controller.barrichellosCarreerResults,
                controller.raikkonensCarreerReasults,
                controller.twoThousandEightRoundsResults,
                answerChecked: answerChecked,
                answerCheck: answerCheck,
                previousIndex: index,
                yValue: yValue,
                xRotationValue: xRotationValue,
                size: size,
                questions: questions,
                controller: controller,
              )
            : const Center(child: CircularProgressIndicator());
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.0),
          borderRadius: BorderRadius.circular(20.0),
          color: const Color(0xFFEE0000),
        ),
        margin: EdgeInsets.symmetric(horizontal: size!.width * 0.21),
        padding: EdgeInsets.all(size!.height * 0.01),
        child: Column(
          children: [
            Text(
              questions![index],
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
