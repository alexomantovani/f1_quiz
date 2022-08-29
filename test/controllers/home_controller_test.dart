import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:f1_quiz/models/barrichellos_carreer_model.dart';
import 'package:f1_quiz/models/finishing_1976_status_model.dart';
import 'package:f1_quiz/models/massas_races_for_ferrari_model.dart';
import 'package:f1_quiz/models/raikkonen_carreer_model.dart';
import 'package:f1_quiz/models/two_thousand_eight_rounds_model.dart';
import 'package:f1_quiz/models/vettels_age_first_title_model.dart';
import 'package:f1_quiz/models/champions_model.dart';
import 'package:f1_quiz/models/prost_titles_model.dart';
import 'package:f1_quiz/models/senna_monaco_victories_model.dart';
import 'package:f1_quiz/models/canadian_gp_1992result_model.dart';
import 'package:f1_quiz/services/json_placeholder_service.dart';

class JsonPlaceHolderServiceMock extends Mock
    implements JsonPlaceholderService {}

void main() {
  final service = JsonPlaceHolderServiceMock();
  test(
    'should load a StandingsModel list correctly',
    () async {
      when(
        () => service.get1992CanadianGpResult(),
      ).thenAnswer((_) async => [
            CanadianGp1992ResultModel(
              driversName: '1',
              constructorsName: '1',
            )
          ]);
    },
  );

  test(
    'should load a SecondResultsModel list correctly',
    () async {
      final service = JsonPlaceHolderServiceMock();

      when(
        () => service.getProstFirstTitle(),
      ).thenAnswer((_) async => [
            ProstTitlesModel(
              constructorName: '1',
            )
          ]);
    },
  );

  test('should load a SennaMonacoVictoriesModel list correctly', () async {
    final service = JsonPlaceHolderServiceMock();

    when(
      () => service.getSennaMonacoVictories(),
    ).thenAnswer((_) async => [
          SennaMonacoVictoriesModel(victoriesCount: '1'),
        ]);
  });

  test('should return a ChampionsModel list correctly', () async {
    final service = JsonPlaceHolderServiceMock();

    when(
      () => service.getAllChampions(),
    ).thenAnswer((invocation) async => [
          ChampionsModel(driverName: '1'),
        ]);
  });

  test('should return a Finishing1976StatusModel list correctly', () async {
    final service = JsonPlaceHolderServiceMock();

    when(
      () => service.getFinishingStatus(),
    ).thenAnswer((_) async => [
          Finishing1976StatusModel(status: '1', circuitName: '1'),
        ]);
  });

  test('should return a MassasFinishedRacesForFerrariModel correctly',
      () async {
    when(
      () => service.getAllMassasFinishedRacesForFerrari(),
    ).thenAnswer((_) async => [
          MassasFinishedRacesForFerrariModel(finishedRacesCount: '1'),
        ]);
  });

  test('should return a VettelsFirstTitleAgeModel correctly', () async {
    when(
      () => service.getVettelsFirstTitleAge(),
    ).thenAnswer((_) async => [
          VettelsAgeFirstTitleModel(
              dateOfBirth: DateTime.parse('1'), season: '1', age: 1),
        ]);
  });

  test('should return a BarrichellosCarreerModel list correctly', () async {
    when(
      () => service.getBarrichellosCarreerRaces(),
    ).thenAnswer((invocation) async => [
          BarrichellosCarreerModel(racesCount: 1),
        ]);
  });

  test('should return a RaikkonensCarreerModel list correctly', () async {
    when(
      () => service.getraikkonensCarreerRaces(),
    ).thenAnswer((invocation) async => [
          RaikkonenCarreerModel(racesCount: 1),
        ]);
  });

  test('should return a TwoThousandEightRoundsModel list correctly', () async {
    when(
      () => service.getTwoThousandEightRounds(),
    ).thenAnswer((_) async => [
          TwoThousandEightRoundsModel(circuitName: '1'),
        ]);
  });
}
