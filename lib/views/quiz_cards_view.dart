import '/views/quiz_menu_view.dart';
import '/widgets/app_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/models/questions_model.dart';
import 'components/animated_card_builder.dart';

class QuizCardsView extends StatefulWidget {
  const QuizCardsView({Key? key}) : super(key: key);
  static const routeName = '/quizCard.dart';

  @override
  State<QuizCardsView> createState() => _QuizCardsViewState();
}

class _QuizCardsViewState extends State<QuizCardsView> {
  // final controller = Modular.get<HomeController>();
  AppDependencies? dependencies;
  final _pageController = PageController(viewportFraction: 0.5);

  Size? size;
  bool isLoaded = false;
  double? barProgressWidth;
  int questionIndex = 1;
  int rightAnswersCount = 0;
  String arguments = '';

  ValueNotifier answersCheck = ValueNotifier(String);
  ValueNotifier answerChecked = ValueNotifier(bool);
  List<String>? questions;

  @override
  void didChangeDependencies() {
    dependencies = AppDependencies.of(context);
    getSettings(context);
    _fetchQuestions();
    size = MediaQuery.of(context).size;
    barProgressWidth = size!.width / 10;
    questions = QuestionsModel().questionnaire[arguments]!;
    super.didChangeDependencies();
  }

  void answerBarProgress() {
    if (barProgressWidth! < 201.22211808809746) {
      barProgressWidth = barProgressWidth! + (size!.width / 9.7);
    } else {
      barProgressWidth = size!.width / 10;
    }
  }

  void updateQuestion() {
    if (questionIndex < 5) {
      questionIndex++;
    } else {
      questionIndex = 1;
    }
  }

  void _fetchQuestions() async {
    if (arguments == 'challengeClassics') {
      dependencies!.controller.fetchAll1992CanadianGpResult();
      dependencies!.controller.fetchAllProstTitlesResults();
      dependencies!.controller.fetchAllSennaMonacoVictoriesResults();
      dependencies!.controller.fetchAllChampionsResults();
      dependencies!.controller.fetchAllLaudas1976FinishingStatusResults();
    } else {
      dependencies!.controller.fetchAllMassasFinishedRacesForFerrariResults();
      dependencies!.controller.fetchAllVettelsDriverStandingsResults();
      dependencies!.controller.fetchAllBarrichellosCarreerResults();
      dependencies!.controller.fetchAllRaikkonensCarreerResults();
      dependencies!.controller.fetchAllTwoThousandEightResults();
    }
  }

  void isLoading() {
    dependencies!.controller.addListener(() {
      if (dependencies!.controller.canadianGP1992Results.isNotEmpty &&
              dependencies!.controller.prostTitlesResults.isNotEmpty &&
              dependencies!.controller.sennaMonacoVictoriesResults.isNotEmpty &&
              dependencies!.controller.championsResults.isNotEmpty &&
              dependencies!.controller.finishing1976StatusResults.isNotEmpty ||
          dependencies!
                  .controller.massasFinishedRacesForFerrariResults.isNotEmpty &&
              dependencies!.controller.vettelsFirstTitleAgeResults.isNotEmpty &&
              dependencies!.controller.barrichellosCarreerResults.isNotEmpty &&
              dependencies!.controller.raikkonensCarreerReasults.isNotEmpty &&
              dependencies!
                  .controller.twoThousandEightRoundsResults.isNotEmpty) {
        setState(() {
          isLoaded = true;
        });
      } else {
        isLoaded = false;
      }
    });
  }

  void getSettings(BuildContext context) {
    arguments = ModalRoute.of(context)!.settings.arguments.toString();
  }

  @override
  Widget build(BuildContext context) {
    isLoading();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 30.0,
        elevation: 0.0,
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Questão $questionIndex/5',
              style: const TextStyle(
                color: Color(0xFFEE0000),
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent.shade100,
                    borderRadius: BorderRadius.circular(
                      20.0,
                    ),
                  ),
                  width: 200.0,
                  height: 20.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.redAccent.shade200,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  width: barProgressWidth,
                  height: 20.0,
                ),
              ],
            ),
            Expanded(
              flex: 2,
              child: PageView.builder(
                itemCount: 5,
                scrollDirection: Axis.vertical,
                pageSnapping: true,
                controller: _pageController,
                itemBuilder: (context, index) {
                  return AnimatedCardBuilder(
                    answerChecked: answerChecked,
                    answerCheck: answersCheck,
                    index: index,
                    pageController: _pageController,
                    isLoaded: isLoaded,
                    controller: dependencies!.controller,
                    size: size,
                    questions: questions,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              onPressed: () {
                if (questionIndex <= 4) {
                  if (answerChecked.value == true) {
                    setState(() {
                      answerBarProgress();
                      updateQuestion();
                      _pageController.nextPage(
                          duration: const Duration(seconds: 1),
                          curve: Curves.ease);
                    });
                  }
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      // contentPadding: EdgeInsets.only(left: size!.width * 0.1),
                      actionsAlignment: MainAxisAlignment.center,
                      content: Text(
                        rightAnswersCount == 0
                            ? '    Você acertou $rightAnswersCount questões! :('
                            : '    Você acertou $rightAnswersCount questões!',
                        style: const TextStyle(
                          color: Color(0xFFEE0000),
                          fontSize: 19.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              answerBarProgress();
                              updateQuestion();
                              rightAnswersCount = 0;
                            });
                            _pageController.jumpToPage(0);
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Refazer',
                            style: TextStyle(
                              color: Color(0xFFEE0000),
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(QuizMenuView.routeName);
                          },
                          child: const Text(
                            'Menu',
                            style: TextStyle(
                              color: Color(0xFFEE0000),
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                if (answersCheck.value == 'true') {
                  rightAnswersCount++;
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlueAccent.shade100,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                elevation: 10.0,
              ),
              child: const Text(
                'Próxima',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
