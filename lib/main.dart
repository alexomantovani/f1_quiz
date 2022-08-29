import 'package:flutter/material.dart';

import '/controllers/home_controller.dart';
import '/services/http_package_client.dart';
import '/services/json_placeholder_service.dart';
import '/widgets/app_dependencies.dart';
import '/views/quiz_cards_view.dart';
import '/views/quiz_menu_view.dart';
import '/views/quiz_intro_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppDependencies(
      httpPackageClient: HttpPackageClient(),
      service: JsonPlaceholderService(),
      controller: HomeController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const QuizIntroView(),
        routes: {
          QuizMenuView.routeName: (context) => const QuizMenuView(),
          QuizCardsView.routeName: (context) => const QuizCardsView(),
        },
      ),
    );
  }
}
