import 'dart:convert';

import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:f1_quiz/services/http_client_interface.dart';
import 'package:f1_quiz/services/constants_responses.dart';

class IHttpClientMock extends Mock implements IHttpClient {}

void main() {
  final client = IHttpClientMock();

  test(
    'should return a list of every driver and constructor of 1992 Canadian GP race',
    () async {
      when(
        () => client.get(any()),
      ).thenAnswer((_) async => jsonDecode(jsonResponse1992CanadianGpResult));
    },
  );

  test(
      'should return a list of final standings from the 1985 to 2021 champonship',
      () async {
    when(
      () => client.get(any()),
    ).thenAnswer((_) async => jsonDecode(jsonResponseProstTitlesResults));
  });

  test('should return a list Senna\'s victories at Monaco', () async {
    when(
      () => client.get(any()),
    ).thenAnswer((_) async => jsonDecode(jsonResponseSennaMonacoVictories));
  });

  test('should return a list of all F1 champions\'s names', () async {
    when(
      () => client.get(any()),
    ).thenAnswer((_) async => jsonDecode(jsonResponseChampionsResults));
  });

  test('should return a list of all Lauda\'s 1996 finishing status ', () async {
    when(
      () => client.get(any()),
    ).thenAnswer((_) async => jsonDecode(jsonResponseFinishing1976Status));
  });

  test('should return a list of all finished Mass\'s races for Ferrari',
      () async {
    when(
      () => client.get(any()),
    ).thenAnswer((_) => jsonDecode(jsonResponseMassasFinishedRacesForFerrari));
  });

  test('should return a all Sebastian Vettle\'s final standings carreer',
      () async {
    when(
      () => client.get(any()),
    ).thenAnswer((_) => jsonDecode(jsonResponseVettelsFirstTitleAgeResult));
  });

  test('should return all Barrichello\'s carreer races', () async {
    when(
      () => client.get(any()),
    ).thenAnswer((_) => jsonDecode(jsonResponseBarrichellosCarreerResult));
  });

  test('should return all Raikkonen\'s carreer races', () async {
    when(
      () => client.get(any()),
    ).thenAnswer((_) => jsonDecode(jsonResponseRaikkonensCarreerResult));
  });

  test('should return all 2008 raounds', () async {
    when(
      () => client.get(any()),
    ).thenAnswer((_) => jsonDecode(jsonResponseTwoThousandEightRoundsResult));
  });
}
