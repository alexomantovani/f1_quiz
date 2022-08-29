import '/controllers/view_controller.dart';
import 'package:flutter/material.dart';

import '/models/barrichellos_carreer_model.dart';
import '/models/canadian_gp_1992result_model.dart';
import '/models/champions_model.dart';
import '/models/finishing_1976_status_model.dart';
import '/models/massas_races_for_ferrari_model.dart';
import '/models/prost_titles_model.dart';
import '/models/raikkonen_carreer_model.dart';
import '/models/senna_monaco_victories_model.dart';
import '/models/two_thousand_eight_rounds_model.dart';
import '/models/vettels_age_first_title_model.dart';

import '../../controllers/home_controller.dart';

class RedCard extends StatelessWidget {
  const RedCard(
    this.canadianGP1992Results,
    this.prostTitlesResults,
    this.sennaMonacoVictoriesResults,
    this.championsResults,
    this.finishing1976StatusResults,
    this.massasFinishedRacesForFerrariResults,
    this.vettelsFirstTitleAgeResults,
    this.barrichellosCarreerResults,
    this.raikkonensCarreerReasults,
    this.twoThousandEightRoundsResults, {
    Key? key,
    required this.answerChecked,
    required this.answerCheck,
    required this.yValue,
    required this.xRotationValue,
    required this.size,
    required this.questions,
    required this.controller,
    required this.previousIndex,
  }) : super(key: key);

  final ValueNotifier answerCheck;
  final ValueNotifier answerChecked;
  final double yValue;
  final double xRotationValue;
  final Size? size;
  final List<String>? questions;
  final HomeController controller;
  final int previousIndex;
  final List<CanadianGp1992ResultModel> canadianGP1992Results;
  final List<ProstTitlesModel> prostTitlesResults;
  final List<SennaMonacoVictoriesModel> sennaMonacoVictoriesResults;
  final List<ChampionsModel> championsResults;
  final List<Finishing1976StatusModel> finishing1976StatusResults;
  final List<MassasFinishedRacesForFerrariModel>
      massasFinishedRacesForFerrariResults;
  final List<VettelsAgeFirstTitleModel> vettelsFirstTitleAgeResults;
  final List<BarrichellosCarreerModel> barrichellosCarreerResults;
  final List<RaikkonenCarreerModel> raikkonensCarreerReasults;
  final List<TwoThousandEightRoundsModel> twoThousandEightRoundsResults;

  @override
  Widget build(BuildContext context) {
    answerChecked.value = false;
    ValueNotifier iconDataIndexZero = ValueNotifier(Icons.circle_outlined);
    ValueNotifier iconDataIndexOne = ValueNotifier(Icons.circle_outlined);
    ValueNotifier iconDataIndexTwo = ValueNotifier(Icons.circle_outlined);
    ValueNotifier iconDataIndexThree = ValueNotifier(Icons.circle_outlined);
    final viewController = ViewController(
        canadianGP1992Results,
        prostTitlesResults,
        sennaMonacoVictoriesResults,
        championsResults,
        finishing1976StatusResults,
        massasFinishedRacesForFerrariResults,
        vettelsFirstTitleAgeResults,
        barrichellosCarreerResults,
        raikkonensCarreerReasults,
        twoThousandEightRoundsResults);

    final List<String> rightAnswersListClassics = [
      'Gerhard Berger',
      'McLaren',
      '6',
      'schumacher',
      'Nürburgring'
    ];
    final List<String> rightAnswersListTwoThousands = [
      '112',
      '23',
      '326',
      '352',
      'Brazilian Grand Prix'
    ];

    void changeIconCircle(int index) {
      if (index == 0) {
        answerChecked.value = true;
        iconDataIndexZero.value = Icons.circle;
        iconDataIndexOne.value = Icons.circle_outlined;
        iconDataIndexTwo.value = Icons.circle_outlined;
        iconDataIndexThree.value = Icons.circle_outlined;
      } else if (index == 1) {
        answerChecked.value = true;
        iconDataIndexOne.value = Icons.circle;
        iconDataIndexZero.value = Icons.circle_outlined;
        iconDataIndexTwo.value = Icons.circle_outlined;
        iconDataIndexThree.value = Icons.circle_outlined;
      } else if (index == 2) {
        answerChecked.value = true;
        iconDataIndexTwo.value = Icons.circle;
        iconDataIndexZero.value = Icons.circle_outlined;
        iconDataIndexOne.value = Icons.circle_outlined;
        iconDataIndexThree.value = Icons.circle_outlined;
      } else if (index == 3) {
        answerChecked.value = true;
        iconDataIndexThree.value = Icons.circle;
        iconDataIndexZero.value = Icons.circle_outlined;
        iconDataIndexOne.value = Icons.circle_outlined;
        iconDataIndexTwo.value = Icons.circle_outlined;
      }
    }

    void quizSwitch(int index) {
      if (questions!.first.startsWith('Qual piloto')) {
        getRightAnswers(
            viewController.returnTitleClassics(index, previousIndex),
            rightAnswersListClassics[previousIndex]);
      } else {
        getRightAnswers(
            viewController.returnTitleTwoThousands(index, previousIndex),
            rightAnswersListTwoThousands[previousIndex]);
      }
    }

    returnStringFunction(int i) {
      if (questions!.first.startsWith('Qual piloto')) {
        return viewController.returnTitleClassics(i, previousIndex);
      } else {
        return viewController.returnTitleTwoThousands(i, previousIndex);
      }
    }

    ValueNotifier _getIconDataByIndex(int index) {
      switch (index) {
        case 0:
          return iconDataIndexZero;
        case 1:
          return iconDataIndexOne;
        case 2:
          return iconDataIndexTwo;
        case 3:
          return iconDataIndexThree;
        default:
          return ValueNotifier(Icons.circle_outlined);
      }
    }

    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.003)
        ..translate(0.0, yValue)
        ..rotateX(xRotationValue),
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.0),
          borderRadius: BorderRadius.circular(20.0),
          color: const Color(0xFFEE0000),
          boxShadow: [
            BoxShadow(
              blurRadius: 10.0,
              spreadRadius: 1.0,
              blurStyle: BlurStyle.normal,
              offset: const Offset(0.0, 10.0),
              color: Colors.black.withOpacity(0.3),
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(horizontal: size!.width * 0.21),
        padding: EdgeInsets.all(size!.height * 0.01),
        child: Column(
          children: [
            Text(
              questions![previousIndex],
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemExtent: size!.height * 0.04,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: GestureDetector(
                      onTap: () {
                        quizSwitch(index);
                        changeIconCircle(index);
                      },
                      child: Text(
                        returnStringFunction(index),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    trailing: ValueListenableBuilder(
                        valueListenable: _getIconDataByIndex(index),
                        builder: (context, value, child) {
                          return Icon(
                            _getIconDataByIndex(index).value,
                            size: size!.width * 0.05,
                            color: Colors.lightBlueAccent.shade100,
                          );
                        }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void rightAnswerCheck(String answers, String rightAnswer) {
    if (answers == rightAnswer) {
      answerCheck.value = 'true';
    } else {
      answerCheck.value = 'false';
    }
  }

  void getRightAnswers(String answers, String rightAnswer) {
    if (previousIndex == 0) {
      rightAnswerCheck(answers, rightAnswer);
    } else if (previousIndex == 1) {
      rightAnswerCheck(answers, rightAnswer);
    } else if (previousIndex == 2) {
      rightAnswerCheck(answers, rightAnswer);
    } else if (previousIndex == 3) {
      rightAnswerCheck(answers, rightAnswer);
    } else {
      rightAnswerCheck(answers, rightAnswer);
    }
  }
}
